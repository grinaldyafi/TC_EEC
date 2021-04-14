import React from 'react';
import classes from '../assets/css/PaperNavigation.module.css';
const questionnavigation = (props) => {
    let color = '';
    let borderColor = '';
    let flag = '';

    if(props.questionIndex === props.currentQuestionIndex){
        borderColor = '1px solid black'
    }

    if (props.userFlag === 1) { flag = 'Y' }

    // if (props.userAnswer === "" || props.userAnswer === null) { color = '#ffa39e' }

    if (props.userAnswer === undefined) { color = '#eee' }
    else if (props.userAnswer !== "" && props.userAnswer !== null){ color = '#adff2f' }

    return (
        <div onClick={props.click} 
        style={{ backgroundColor: color, border: borderColor }}
             className={classes.boxes}>
            <div className={classes.boxesNumber}>
                {flag === 'Y' ? <div className={classes.flag}></div> : null}
                <span className={classes.questionindex}>
                    {props.questionIndex + 1}
                </span>
            </div>
            
        </div>
    );

}
export default questionnavigation;