import React from 'react';
import classes from '../assets/css/Profile.module.css';
import Header from '../Components/Header';
import { Button } from 'antd';
import 'antd/es/button/style/index.css';
import 'antd/es/message/style/index.css';

const Profile = (props) => {
    return (
        <div>
            <Header />
            <div className={classes.content}>
                <div className={classes.userInfo}>
                    Profile Team
                    <br />
                    nama: xixixi
                    <br />
                    <br />
                    <Button type="primary" size="small" onClick={props.startSession}>Start Quiz</Button>
                </div>
            </div>
        </div>
    );
}
export default Profile;