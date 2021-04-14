import { SETUSERDATA, DELETEUSERDATA, SUBMIT, UNSUBMIT } from "./actionTypes";

export const setUserData = (data) => ({
  type: SETUSERDATA,
  data,
}); 

export const deleteUserData = () => ({
  type: DELETEUSERDATA,
}); 

export const submitPaper = () => ({
  type: SUBMIT,
  status: true
});

export const unSubmitPaper = () => ({
  type: UNSUBMIT,
  status: false
});

