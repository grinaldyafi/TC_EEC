import React, { Component } from 'react';
import Paper from './Containers/Paper'
import Submit from './Containers/Submit'
import 'firebase/auth'
import './App.css';
import { withRouter } from 'react-router-dom';
import { bindActionCreators } from "redux";
import { connect } from "react-redux";
import {
  setUserData,
  deleteUserData,
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
  submitPaper = (paper) => {
    this.props.setUserData(paper)
    this.props.submitPaper()
  }

  render() {
    return (
      <div className="App">
        <Switch>
          <Route path="/penyisihan">
            {!this.props.submit && <Paper submitPaper={this.submitPaper} />}
          </Route>
          <Route path="/submit">
            {this.props.submit && <Submit backToPaper={() => { this.props.unSubmitPaper() }} paper={this.props.user} />}
          </Route>
        </Switch>
        {!this.props.submit && <Redirect to="/penyisihan" />}
        {this.props.submit && <Redirect to="/submit" />}
      </div>
    )
  };
}



function mapStateToProps(state) {
  return {
    user: state.user,
    submit: state.submit
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      setUserData: setUserData,
      deleteUserData: deleteUserData,
      submitPaper: submitPaper,
      unSubmitPaper: unSubmitPaper,
    },
    dispatch
  );
}

export default connect(mapStateToProps, mapDispatchToProps)(withRouter(App));
