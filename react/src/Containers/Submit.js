import React, { useEffect } from 'react';
import classes from '../assets/css/Submit.module.css';
import PaperNavigation from '../Components/PaperNavigation';
import Header from '../Components/Header';
import 'firebase/database'
import 'firebase/firestore'
import 'firebase/auth'
import { Button } from 'antd';
import {
  LeftOutlined,
  SaveOutlined
} from '@ant-design/icons';
import 'antd/es/button/style/index.css';
import 'antd/es/message/style/index.css';


const Submit = (props) => {
    // const maxTime = new Date().setHours(23, 45, 0);
    const maxTime = new Date("July 21, 2022 01:15:00");
    useEffect(() => {
          const interval = setInterval(() => {
            updateTime();
          }, 1000);
          // console.log(props)
    })
  
    const updateTime = () => {
      if (maxTime <= new Date()) {
        document.getElementById('submitForm').submit();
      }
    }
    
    return (
        <div>
            <Header />
            <div className={classes.paperInformation}>
              <div className={classes.paperCounter}>
                <div className={classes.counter}>
                  <div className={classes.counterAnswered}><div>{props.paper.questionAnsweredCounter}</div></div>
                  <span>Questions Answered</span>
                </div>
                <div className={classes.counter}>
                  <div className={classes.counterReview}><div>{props.paper.questionFlagCounter}</div></div>
                  <span>Questions In Review</span>
                </div>
                <div className={classes.counter}>
                  <div className={classes.counterNotAnswered}><div>{props.paper.questionNotAnsweredCounter}</div></div>
                  <span>Questions Not Answered</span>
                </div>
              </div>
              {/* navigation section */}
              <div className={classes.paperNavgation}>
                {props.paper.questions.map((questionAnswerObj, questionIndex) => {
                  return <PaperNavigation click={() => this.questionNavigationClick(questionAnswerObj, questionIndex)} userAnswer={props.paper.answers[questionIndex]} userFlag={props.paper.flag[questionIndex]} key={questionIndex} questionIndex={questionIndex} currentQuestionIndex={props.paper.currentQuestionIndex} />;
                })}
              </div>
            </div>
            <form action={baseUrl + '/submitPaper'} method="POST" id="submitForm">
                <input type="text" name="team_id" value={teamID} readOnly/>
                <input type="text" name="answer" value={JSON.stringify(props.paper.answers)} readOnly/>
                <Button type="primary" icon={<LeftOutlined />} size="small" onClick={props.backToPaper}>Back</Button>
                <button type="submit" icon={<SaveOutlined />} size="small" >Submit</button>
            </form>
        </div>
    );
}
export default Submit;