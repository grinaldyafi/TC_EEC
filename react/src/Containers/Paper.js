import React, { Component } from 'react';
import classes from '../assets/css/Paper.module.css';
import PaperNavigation from '../Components/PaperNavigation';
import Header from '../Components/Header';
import firebase from '../utils/Firebase/Firebase';
import 'firebase/database'
import 'firebase/firestore'
import 'firebase/auth'
import { message } from 'antd';
import { Button } from 'antd';
import { Spin } from 'antd';
import { LoadingOutlined, RightSquareOutlined, HistoryOutlined, UndoOutlined, RightOutlined, LeftOutlined, SaveOutlined } from '@ant-design/icons';
import 'antd/es/button/style/index.css';
import 'antd/es/message/style/index.css';
import axios from "axios";
// import logo from '../assets/logo.png';
const loadingIcon = < LoadingOutlined style = {
    { fontSize: 24 }
}
spin / > ;
// const { firebase } = require('../../Firebase/Firebase');


class Paper extends Component {
    constructor(props) {
        super(props);

        //inisialisasi state
        this.state = {
            loading: true,
            email: 'john',
            questions: [],
            answers: { 0: "" },
            flag: { 0: 0 },
            currentQuestionIndex: 0,
            currentQuestion: {
                answer1: 'loading',
                answer2: 'loading',
                answer3: 'laoding',
                answer4: 'loading',
                question: 'loading'
            },
            selectedOption: "",
            questionNotAnsweredCounter: 0,
            questionAnsweredCounter: 0,
            questionFlagCounter: 0,
        }
    }

    // get questions
    pullTestQuestions = async() => {
        console.log('pulling')
        var self = this;
        await axios.post('https://technocornerugm.com/api/getQuestion')
            .then(async function(response) {
                console.log(response.data)
                let length = response.data.length;
                self.setState({
                    questions: response.data,
                    currentQuestion: response.data[0],
                    questionNotAnsweredCounter: length
                });
            })
            .catch(async function(error) {
                console.log(error);
            });

        // // inisialisasi databaase reference
        // let testRef = firebase.firestore().collection('exam').doc('6NkIRrzVrnp0opuEyMfH');

        // //get document
        // await testRef.get()
        //   .then((doc) => {
        //     console.log(doc.data().paper);
        //     let length = doc.data().paper.length;
        //     this.setState({
        //       questions: doc.data().paper,
        //       currentQuestion: doc.data().paper[0],
        //       questionNotAnsweredCounter: length
        //     });
        //   })
        //   .catch(err => {
        //     console.log('Error getting question paper', err);
        //   });

        console.log('pulling done')
        await this.firstFetch();
    }

    // get data from this user
    firstFetch = async() => {
        console.log('fethcing' + this.state.email)
            // inisialisasi database reference
        var databaseRef = firebase.database().ref('data/' + this.state.email);
        var self = this;

        // get data
        await databaseRef.once('value').then((snapshot) => {
            if (snapshot.val()) {
                // for each document
                snapshot.forEach(data => {
                    // inisialisasi nomor 
                    let nomor = data.val().number - 1;

                    // set state
                    self.setState(prevState => {
                        return ({
                            questionAnsweredCounter: prevState.questionAnsweredCounter + (data.val().answer !== '' ? 1 : 0),
                            questionNotAnsweredCounter: prevState.questionNotAnsweredCounter - (data.val().answer !== '' ? 1 : 0),
                            answers: {...prevState.answers, [nomor]: data.val().answer !== '' ? data.val().answer : '' },
                            flag: {...prevState.flag, [nomor]: data.val().flag },
                            questionFlagCounter: prevState.questionFlagCounter + (data.val().flag === 1 ? 1 : 0),
                        });
                    });
                });
            }
        });

        //atur selected option pada nomor sekarang (nomor 0)
        self.setState({
            selectedOption: self.state.answers[self.state.currentQuestionIndex],
            loading: false
        })

        // const maxTime = new Date().setHours(23, 45, 0);
        const maxTime = new Date("July 21, 2022 01:15:00");
        var timer = setInterval(
            () => this.updateTime(maxTime),
            1000
        );

        console.log('fethcing done')
    }

    async componentDidMount() {
        // load pertanyaan
        await this.pullTestQuestions();

        // inisialisasi database reference
        var databaseRef = firebase.database().ref('data/' + this.state.email);
        var self = this

        // event listener change
        databaseRef.on("child_changed", function(data) {
            // inisialisasi index nomor
            var nomorIndex = data.val().number - 1;

            // ketika add / delete / update
            if (data.val().event === 'answerAdd' || data.val().event === 'answerDel' || data.val().event === 'answerUpdate') {
                self.setState(prevState => ({
                    questionAnsweredCounter: prevState.questionAnsweredCounter + (
                        data.val().event === 'answerAdd' ? 1 : (
                            data.val().event === 'answerDel' ? -1 : 0
                        )
                    ),
                    questionNotAnsweredCounter: prevState.questionNotAnsweredCounter + (
                        data.val().event === 'answerAdd' ? -1 : (
                            data.val().event === 'answerDel' ? 1 : 0
                        )
                    ),
                    answers: {...prevState.answers, [nomorIndex]: data.val().answer },
                    selectedOption: self.state.currentQuestionIndex === nomorIndex ? data.val().answer : self.state.answers[self.state.currentQuestionIndex],
                }))
            }

            //ketika event review
            if (data.val().event === 'flag') {
                self.setState(prevState => ({
                    questionFlagCounter: prevState.questionFlagCounter + (
                        data.val().flag === 1 ? 1 : (
                            data.val().flag === 0 ? -1 : 0
                        )
                    ),
                    flag: {...self.state.flag, [nomorIndex]: data.val().flag },
                }));
            }
        });
    }

    updateTime = (maxTime) => {
        if (maxTime <= new Date()) {
            this.props.submitPaper(this.state)
        }
    }

    // select / change options handler.
    selectOptionHandler = event => {
        this.setState({
            selectedOption: event.target.value
        });
    };

    // save button
    saveAnswer = async(selectedOption, currentQuestionIndex) => {
        if (selectedOption === "") {
            alert('Please select an answer!');
            return;
        }

        var self = this;
        var nomor = currentQuestionIndex + 1;

        // inisialisasi database reference
        var databaseRef = firebase.database().ref('data/' + this.state.email + '/' + nomor);

        //ketika jawaban berubah
        if (self.state.answers[currentQuestionIndex] !== selectedOption) {
            if (self.state.answers[currentQuestionIndex] === '') {
                await databaseRef.set({
                    number: nomor,
                    answer: selectedOption,
                    flag: self.state.flag[currentQuestionIndex],
                    event: 'answerAdd'
                });
            } else {
                await databaseRef.set({
                    number: nomor,
                    answer: selectedOption,
                    flag: self.state.flag[currentQuestionIndex],
                    event: 'answerUpdate'
                });
            }
        }

        // next
        this.nextQuestion(currentQuestionIndex);
    }

    // clear button
    clearAnswer = async(currentQuestionIndex) => {
        // ketika tidak ada jawaban
        if (this.state.answers[currentQuestionIndex] === "") {
            alert('Nothing to Clear !');
            return;
        }

        var self = this
        var nomor = currentQuestionIndex + 1

        // inisialisasi database reference for delete
        var databaseRef = firebase.database().ref('data/' + this.state.email + '/' + nomor)
        await databaseRef.set({
            number: nomor,
            answer: '',
            flag: self.state.flag[currentQuestionIndex],
            event: 'answerDel'
        });
    }

    // review button
    markForReview = async(currentQuestionIndex) => {
        var self = this
        var nomor = currentQuestionIndex + 1

        // inisialisasi database reference add flag
        var databaseRef = firebase.database().ref('data/' + this.state.email + '/' + nomor);
        await databaseRef.set({
            number: nomor,
            answer: self.state.answers[currentQuestionIndex],
            flag: 1,
            event: 'flag'
        });
    }

    clearReview = async(currentQuestionIndex) => {
        var self = this
        var nomor = currentQuestionIndex + 1

        // inisialisasi database reference for delete flag
        var databaseRef = firebase.database().ref('data/' + this.state.email + '/' + nomor);
        await databaseRef.set({
            number: nomor,
            answer: self.state.answers[currentQuestionIndex],
            flag: 0,
            event: 'flag'
        });
    }

    // next button
    nextQuestion = (currentQuestionIndex) => {
        // ketika nomor terakhir
        if (currentQuestionIndex >= this.state.questions.length - 1) {
            alert('this is the last question');
            return;
        }

        this.setState({
            selectedOption: this.state.answers[currentQuestionIndex + 1],
            currentQuestion: this.state.questions[currentQuestionIndex + 1],
            currentQuestionIndex: currentQuestionIndex + 1
        });
    }

    // previous button
    previousQuestion = (currentQuestionIndex) => {
        if (currentQuestionIndex === 0) {
            message.warn("This is the first Question !");
            return;
        }

        this.setState({
            selectedOption: this.state.answers[currentQuestionIndex - 1],
            currentQuestion: this.state.questions[currentQuestionIndex - 1],
            currentQuestionIndex: currentQuestionIndex - 1
        });
    }

    // navigasi menggunakan nomor
    questionNavigationClick = (questionAnswerObj, questionIndex) => {
        // load question from selected number 
        this.setState({
            currentQuestion: questionAnswerObj,
            currentQuestionIndex: questionIndex,
            selectedOption: this.state.answers[questionIndex]
        });
    }

    render() {
        return ( <
            React.Fragment >
            <
            div className = { classes.parent } >
            <
            Header / > {
                this.state.loading ? < div className = { classes.spinner } > < Spin className = { classes.spinnerContent }
                indicator = { loadingIcon }
                /></div > :
                    ( < div className = { classes.content } >

                        { /* body */ } <
                        div className = { classes.paperContent } > { /* body question answer */ } <
                        div className = { classes.paperBody } >
                        <
                        p className = { classes.currentQuestiontext } >
                        <
                        b > Question No. { this.state.currentQuestionIndex + 1 } < /b> <
                        br / > { this.state.currentQuestion.question } <
                        /p>

                        <
                        div className = { classes.hrline } > < /div> <
                        br / >

                        { /* <div> */ } <
                        p className = { classes.optionstext } >
                        <
                        b > Options: < /b> < /
                        p > <
                        label className = { classes.options } >
                        <
                        input type = "radio"
                        checked = { this.state.selectedOption === 'A' }
                        value = "A"
                        onChange = { this.selectOptionHandler }
                        /> { this.state.currentQuestion.answer1 } < /
                        label > <
                        label className = { classes.options } >
                        <
                        input type = "radio"
                        checked = { this.state.selectedOption === 'B' }
                        value = "B"
                        onChange = { this.selectOptionHandler }
                        /> { this.state.currentQuestion.answer2 } < /
                        label > <
                        label className = { classes.options } >
                        <
                        input type = "radio"
                        checked = { this.state.selectedOption === 'C' }
                        value = "C"
                        onChange = { this.selectOptionHandler }
                        /> { this.state.currentQuestion.answer3 } < /
                        label > <
                        label className = { classes.options } >
                        <
                        input type = "radio"
                        checked = { this.state.selectedOption === 'D' }
                        value = "D"
                        onChange = { this.selectOptionHandler }
                        /> { this.state.currentQuestion.answer4 } < /
                        label > { /* </div> */ } <
                        /div>


                        { /* body - status */ } <
                        div className = { classes.paperInformation } >
                        <
                        div className = { classes.paperCounter } >
                        <
                        div className = { classes.counter } >
                        <
                        div className = { classes.counterAnswered } > < div > { this.state.questionAnsweredCounter } < /div></div >
                        <
                        span > Questions Answered < /span> < /
                        div > <
                        div className = { classes.counter } >
                        <
                        div className = { classes.counterReview } > < div > { this.state.questionFlagCounter } < /div></div >
                        <
                        span > Questions In Review < /span> < /
                        div > <
                        div className = { classes.counter } >
                        <
                        div className = { classes.counterNotAnswered } > < div > { this.state.questionNotAnsweredCounter } < /div></div >
                        <
                        span > Questions Not Answered < /span> < /
                        div > <
                        /div> { / * navigation section * / } <
                        div className = { classes.paperNavgation } > {
                            this.state.questions.map((questionAnswerObj, questionIndex) => {
                                return <PaperNavigation click = {
                                    () => this.questionNavigationClick(questionAnswerObj, questionIndex)
                                }
                                userAnswer = { this.state.answers[questionIndex] }
                                userFlag = { this.state.flag[questionIndex] }
                                key = { questionIndex }
                                questionIndex = { questionIndex }
                                currentQuestionIndex = { this.state.currentQuestionIndex }
                                />;
                            })
                        } <
                        /div> < /
                        div >

                        <
                        /div>

                        <
                        br / >


                        { /* body - panel button */ } <
                        div className = { classes.paperButton } >
                        <
                        div className = { classes.questionpapercontrolsrowone } >
                        <
                        Button type = "primary"
                        icon = { < RightSquareOutlined / > }
                        size = "small"
                        onClick = {
                            () => this.saveAnswer(this.state.selectedOption, this.state.currentQuestionIndex)
                        } > Save and Next < /Button> <
                        Button type = "primary"
                        icon = { < UndoOutlined / > }
                        size = "small"
                        onClick = {
                            () => this.clearAnswer(this.state.currentQuestionIndex)
                        } > Clear < /Button> {
                        this.state.flag[this.state.currentQuestionIndex] !== 1 &&
                        <
                        Button type = "primary"
                        icon = { < HistoryOutlined / > }
                        size = "small"
                        onClick = {
                            () => this.markForReview(this.state.currentQuestionIndex)
                        } >
                        Mark For Review <
                        /Button>
                    } {
                        this.state.flag[this.state.currentQuestionIndex] === 1 &&
                            <
                            Button type = "primary"
                        icon = { < HistoryOutlined / > }
                        size = "small"
                        onClick = {
                                () => this.clearReview(this.state.currentQuestionIndex)
                            } >
                            Clear Review <
                            /Button>
                    } <
                    /div> <
                div className = { classes.questionpapercontrolsrowtwo } >
                <
                Button type = "primary"
                icon = { < LeftOutlined / > }
                size = "small"
                disabled = { this.state.currentQuestionIndex === 0 }
                onClick = {
                    () => this.previousQuestion(this.state.currentQuestionIndex)
                } > Previous < /Button> <
                Button type = "primary"
                icon = { < RightOutlined / > }
                size = "small"
                disabled = { this.state.currentQuestionIndex === this.state.questions.length - 1 }
                onClick = {
                    () => this.nextQuestion(this.state.currentQuestionIndex)
                } > Next < /Button> <
                Button type = "primary"
                icon = { < SaveOutlined / > }
                size = "small"
                onClick = {
                    () => { this.props.submitPaper(this.state) }
                } > Submit < /Button> < /
                div > <
                /div>


                <
                /div>)
            } <
            /div> < /
            React.Fragment >

        );
    }
}
export default Paper;