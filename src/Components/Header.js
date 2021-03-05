import React, { useState, useEffect } from 'react';
import classes from '../assets/css/Component.module.css';
import logo from '../assets/logo.png';
import firebase from '../utils/Firebase/Firebase';;
const Header = (props) => {
    const[ username, setUsername ] = useState()


    useEffect( () => {
        var getEmail = firebase.auth().currentUser.email
        setUsername(getEmail.slice(0, -9))
    }, [username])

    return (
        <div className={classes.header}>
            <div className={classes.headerContent}>
                <div className={classes.headerItems}>
                    <img src={logo} alt="technocorner-logo" className={classes.logoTC}/>
                    <div className={classes.userInfo}>
                        <p>{username}</p>
                        <button onClick={() => { firebase.auth().signOut() }}> Logout </button>
                    </div>
                </div>
            </div>
        </div>
    );

}
export default Header;