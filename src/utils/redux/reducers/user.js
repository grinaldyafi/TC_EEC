import { SETUSERDATA, DELETEUSERDATA } from "../actionTypes";

const initialState = {}

const auth = (state = initialState, action) => {
  switch (action.type) {
    case SETUSERDATA:
      return action.data;
    case DELETEUSERDATA:
      return {};
    default:
      return state;
  }
};

export default auth;