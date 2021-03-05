import { LOGIN, LOGOUT, SETUSERDATA, DELETEUSERDATA, START, NOTSTART, SUBMIT, UNSUBMIT } from "./actionTypes";

export const logIn = () => ({
  type: LOGIN,
  status: true
});

export const logOut = () => ({
  type: LOGOUT,
  status: false
});

export const setUserData = (data) => ({
  type: SETUSERDATA,
  data,
}); 

export const deleteUserData = () => ({
  type: DELETEUSERDATA,
}); 

export const startSession = () => ({
  type: START,
  status: true
});

export const finishSession = () => ({
  type: NOTSTART,
  status: false
});

export const submitPaper = () => ({
  type: SUBMIT,
  status: true
});

export const unSubmitPaper = () => ({
  type: UNSUBMIT,
  status: false
});

