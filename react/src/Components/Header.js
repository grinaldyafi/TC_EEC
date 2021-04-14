import React, { useState, useEffect } from 'react';
import classes from '../assets/css/Component.module.css';
import logo from '../assets/logo.png';
import firebase from '../utils/Firebase/Firebase';;
const Header = (props) => {
    const [username, setUsername] = useState();
    const [hour, setHour] = useState(0);
    const [minute, setMinutes] = useState(0);
    const [second, setSeconds] = useState(0);
    useEffect(() => {
        var _second = 1000;
        var _minute = _second * 60;
        var _hour = _minute * 60;
        var _day = _hour * 24;
        // const maxTime = new Date().setHours(23, 45, 0);
        const maxTime = new Date("July 21, 2022 01:15:00");
        var getEmail = 'john'
        setUsername(getEmail)
        const interval = setInterval(() => {
            var now = new Date();
            var distance = maxTime - now;
            if (distance < 0) {
                clearInterval(interval);
                return;
            }
            var days = Math.floor(distance / _day);
            var hours = Math.floor((distance % _day) / _hour);
            var minutes = Math.floor((distance % _hour) / _minute);
            var seconds = Math.floor((distance % _minute) / _second);
            setHour(hours);
            setMinutes(minutes);
            setSeconds(seconds);
        }, 1000);
    }, [username])

    return (
        <div className={classes.header}>
            <div className={classes.headerContent}>
                <div className={classes.headerItems}>
                    <img src={logo} alt="technocorner-logo" className={classes.logoTC}/>
                    <div className={classes.userInfo}>
                        <p>{username}</p>
                        <p>{hour + ':' + minute + ':' + second}</p>
                        <a href={baseUrl+'/logout'}><button> Logout </button></a>
                    </div>
                </div>
            </div>
        </div>
    );

}
export default Header;