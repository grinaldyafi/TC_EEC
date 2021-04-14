//firebase.js
import firebase from "firebase/app";

const config = {
    apiKey: "AIzaSyANWvz_sdUwiFthgqJm3vm6Y9cFN_mInco",
    authDomain: "eec-test-efd0d.firebaseapp.com",
    databaseURL: "https://eec-test-efd0d-default-rtdb.firebaseio.com",
    projectId: "eec-test-efd0d",
    storageBucket: "eec-test-efd0d.appspot.com",
    messagingSenderId: "857595992586",
    appId: "1:857595992586:web:fafe7e390d74f44e7d5df3"
};

if (!firebase.apps.length) {
    firebase.initializeApp(config)
}

// module.exports = { firebase }
export default firebase