import React, { Component } from 'react';
import Paper from './Containers/Paper'
import Login from './Containers/Login'
import Profile from './Containers/Profile'
import Submit from './Containers/Submit'
import firebase from './utils/Firebase/Firebase';
import 'firebase/auth'
import './App.css';
import { withRouter } from 'react-router-dom';
import { bindActionCreators } from "redux";
import { connect } from "react-redux";
import {
  logIn,
  logOut,
  setUserData,
  deleteUserData,
  startSession,
  finishSession,
  submitPaper,
  unSubmitPaper
} from "./utils/redux/actions";
import {
  Switch,
  Route,
  Redirect
  // Link
} from "react-router-dom";


class App extends Component {
  componentDidMount() {
    var self = this
    firebase.auth().onAuthStateChanged(function(user) {
      if (user) {
        self.props.logIn()
        // self.setLogin()
      } else {
        self.props.logOut()
        self.props.logOut()
        self.props.deleteUserData()
        self.props.finishSession()
        self.props.unSubmitPaper()
      }
    });
  }

  logout = async () => {
    firebase.auth().signOut()
  }

  submitPaper = (paper) => {
    this.props.setUserData(paper)
    this.props.submitPaper()
  }

  sendPaper = (paper) => {
    this.props.unSubmitPaper()
    this.props.finishSession()
  }

  render() {
    return (
      <div className="App">
        <Switch>
          <Route path="/login">
            <Login />
          </Route>
          <Route path="/profile">
            {this.props.auth && !this.props.start && <Profile startSession={() => { this.props.startSession() }} logout={ this.logout }/>}
          </Route>
          <Route path="/penyisihan">
            {this.props.auth && this.props.start && !this.props.submit && <Paper submitPaper={this.submitPaper} />}
          </Route>
          <Route path="/submit">
            {this.props.auth && this.props.start && this.props.submit && <Submit backToPaper={() => { this.props.unSubmitPaper() }} sendPaper={this.sendPaper} paper={this.props.user} />}
          </Route>
        </Switch>
        {!this.props.auth && <Redirect to="/login" />}
        {this.props.auth && !this.props.start&& <Redirect to="/profile" />}
        {this.props.auth && this.props.start && !this.props.submit && <Redirect to="/penyisihan" />}
        {this.props.auth && this.props.start && this.props.submit && <Redirect to="/submit" />}
      </div>
    )
  };
}



function mapStateToProps(state) {
  return {
    auth: state.auth,
    user: state.user,
    start: state.start,
    submit: state.submit
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      logIn: logIn,
      logOut: logOut,
      setUserData: setUserData,
      deleteUserData: deleteUserData,
      startSession: startSession,
      finishSession: finishSession,
      submitPaper: submitPaper,
      unSubmitPaper: unSubmitPaper,
    },
    dispatch
  );
}

export default connect(mapStateToProps, mapDispatchToProps)(withRouter(App));
