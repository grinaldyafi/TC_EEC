import React, { useState } from 'react';
import classes from '../assets/css/Login.module.css';
import firebase from '../utils/Firebase/Firebase';
import 'firebase/database'
import 'firebase/firestore'
import 'firebase/auth'
// import { message } from 'antd';
// import { Button } from 'antd';
import { Spin } from 'antd';
import { LoadingOutlined } from '@ant-design/icons';
import 'antd/es/button/style/index.css';
import 'antd/es/message/style/index.css';
// import logo from '../assets/logo.png';

import { connect } from 'react-redux';
import { logIn, logOut } from '../utils/redux/actions';

const loadingIcon = <LoadingOutlined style={{ fontSize: 24 }} spin />;


const Login = (props) => {
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [errorMessage, setErrorMessage] = useState()
    const [loading, setLoading] = useState()


    const onSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        try{
            await firebase.auth().signInWithEmailAndPassword(email, password)
            console.log('succes')
            props.logIn()
            setLoading(false)
        } catch (error) {
            if (email === '') {
                setErrorMessage('empty email field')
            } else if (password === '') {
                setErrorMessage('empty password field')
            } else if (error.code === 'auth/user-not-found' || error.code === 'auth/wrong-password') {
                setErrorMessage('Invalid user or password')
            } else {
                setErrorMessage(error.message)
            }
            setLoading(false)
        };
    }
    
    return (
        <div className={classes.content}>
            {loading ? <Spin className={classes.spinner} indicator={loadingIcon} /> :
                <div className={classes.loginForm}>
                    <form onSubmit={onSubmit}>
                        <div>
                            <label className={classes.marginbottom}>
                                Username:
                        </label>
                            <input
                                type="email"
                                name="qa"
                                defaultValue={email}
                                placeholder="username"
                                className="form-check-input"
                                onInput={e => setEmail(e.target.value)}
                            />
                        </div>
                        <br />
                        <div>
                            <label className={classes.marginbottom}>
                                Password:
                        </label>
                            <input
                                type="text"
                                name="qa"
                                defaultValue={password}
                                placeholder="passwor"
                                className="form-check-input"
                                onInput={e => setPassword(e.target.value)}
                            />
                        </div>
                        <br />
                        <input type="submit" />
                    </form>
                    <p>{errorMessage}</p>
                </div>
            }
        </div>
    );
}


const mapStateToProps = state => ({
  auth: state.auth
});

const mapDispatchToProps = {
  logIn,
  logOut
};

const LoginPage = connect(
  mapStateToProps,
  mapDispatchToProps
)(Login);

export default LoginPage;