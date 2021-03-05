import { SUBMIT, UNSUBMIT } from "../actionTypes";

const initialState = false


const submit = (state = initialState, action) => {
  switch (action.type) {
    case SUBMIT:
      return action.status;
    case UNSUBMIT:
      return action.status;
    default:
      return state;
  }
};

export default submit;