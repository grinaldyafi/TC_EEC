import { LOGIN, LOGOUT } from "../actionTypes";

const initialState = false


const auth = (state = initialState, action) => {
  switch (action.type) {
    case LOGIN:
      return action.status;
    case LOGOUT:
      return action.status;
    default:
      return state;
  }
};

export default auth;