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
    useEffect(() => {
        console.log(props)
    })
    
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

            <Button type="primary" icon={<LeftOutlined />} size="small" onClick={props.backToPaper}>Back</Button>
            <Button type="primary" icon={<SaveOutlined />} size="small" onClick={props.sendPaper}>Submit</Button>
        </div>
    );
}
export default Submit;