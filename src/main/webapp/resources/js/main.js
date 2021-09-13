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
  document.querySelector(".join-modal").style.display = "block";
}

function joinExitbtnClicked() {
	console.log("clicked");
  document.querySelector(".join-modal").style.display = "none";
}

function joinoutsideClick(e) {
  if (e.target == joinModal) {
    document.querySelector(".join-modal").style.display = "none";
  }
}

// login modal

function loginnbtnClicked() {
  document.querySelector(".login-modal").style.display = "block";
}

function loginExitbtnClicked() {
  document.querySelector(".login-modal").style.display = "none";
}

function loginoutsideClick(e) {
  if (e.target == loginModal) {
    document.querySelector(".login-modal").style.display = "none";
  }
}

//move to Join

function moveTojoinPage() {
  document.querySelector(".login-modal").style.display = "none";
  document.querySelector(".join-modal").style.display = "block";
}
function getInDate(){
	const today = new Date().toISOString().split("T")[0];
	document.getElementById("CheckinDate").setAttribute("min", today);
}

function getOutDate(){
	let checkindate = document.getElementById("CheckinDate").value;
  	document.getElementById("CheckoutDate").setAttribute("min", checkindate);
	
}

checkInDate.addEventListener("change", getCheckinDate);

function getCheckinDate(e) {
  let checkindate = e.target.value;
  checkOutDate.setAttribute("min", checkindate);
}
/**
 * 
 */