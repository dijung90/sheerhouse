const joinnbtn = document.querySelector(".joinBtn");
const loginbtn = document.querySelector(".loginBtn");
const joinExitBtn = document.querySelector(".join-exitBtn");
const joinModal = document.querySelector(".join-modal");
const loginExitBtn = document.querySelector(".login-exitBtn");
const loginModal = document.querySelector(".login-modal");
const checkInDate = document.getElementById("CheckinDate");
const checkOutDate = document.getElementById("CheckoutDate");
const movoToJoin = document.querySelector(".movoToJoin");
// joinModal

function joginBtnClicked() {
  joinModal.style.display = "block";
}

function joinExitbtnClicked() {
  joinModal.style.display = "none";
  console.log("hi");
}

function joinoutsideClick(e) {
  if (e.target == joinModal) {
    joinModal.style.display = "none";
  }
}

// login modal

function loginnbtnClicked() {
  loginModal.style.display = "block";
}

function loginExitbtnClicked() {
  loginModal.style.display = "none";
  console.log("hihi");
}

function loginoutsideClick(e) {
  if (e.target == loginModal) {
    loginModal.style.display = "none";
  }
}

//move to Join

function moveTojoinPage() {
  loginModal.style.display = "none";
  joinModal.style.display = "block";
}

const today = new Date().toISOString().split("T")[0];

function getCheckinDate(e) {
  let checkindate = e.target.value;
  checkOutDate.setAttribute("min", checkindate);
}

joinnbtn.addEventListener("click", joginBtnClicked);
joinExitBtn.addEventListener("click", joinExitbtnClicked);
window.addEventListener("click", joinoutsideClick);

checkInDate.setAttribute("min", today);
checkInDate.addEventListener("change", getCheckinDate);

loginbtn.addEventListener("click", loginnbtnClicked);
loginExitBtn.addEventListener("click", loginExitbtnClicked);
window.addEventListener("click", loginoutsideClick);
movoToJoin.addEventListener("click", moveTojoinPage);

// Banner functions people incre decre Btn

function search() {
  const peopleBtnContainer = document.querySelector(".peopleBtnContainer");
  peopleBtnContainer.style.display = "block";
}

function peopleIncre() {
  const peopleNumInput = document.querySelector(".peopleBtnNumInput");
  const peoInput = document.querySelector(".peopleBtnNumInput");
  const peopleNumInfo = document.querySelector(".peopleNumInfo");
  let currentValue = parseInt(peopleNumInput.value);
  peoInput.value = currentValue + 1;
  peopleNumInfo.value = currentValue + 1;
  console.log(currentValue + 1);
}

function peopleDecre() {
  const peopleNumInput = document.querySelector(".peopleBtnNumInput");
  const peoInput = document.querySelector(".peopleBtnNumInput");
  const peopleNumInfo = document.querySelector(".peopleNumInfo");
  let currentValue = parseInt(peopleNumInput.value);
  if (currentValue <= 0) {
    peoInput.value = 0;
  } else {
    peoInput.value = currentValue - 1;
    peopleNumInfo.value = currentValue - 1;
  }
  console.log(currentValue - 1);
}
