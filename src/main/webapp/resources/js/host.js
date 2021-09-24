function proTypeArrow() {
  const propertyTypeSection = document.querySelector(".property-type");
  const propertyLocationSection = document.querySelector(".property-location");
  propertyTypeSection.style.display = "none";
  propertyLocationSection.style.display = "block";
}

function proLocationRightArrow() {
  const propertyLocationSection = document.querySelector(".property-location");
  const propertyImagesSection = document.querySelector(".property-images");
  propertyLocationSection.style.display = "none";
  propertyImagesSection.style.display = "block";
}

function proLocationLeftArrow() {
  const propertyLocationSection = document.querySelector(".property-location");
  const propertyTypeSection = document.querySelector(".property-type");
  propertyLocationSection.style.display = "none";
  propertyTypeSection.style.display = "block";
}

function proImagesRightArrow() {
  const propertyImagesSection = document.querySelector(".property-images");
  const propertyMaxPeo = document.querySelector(".property-maxPeo");
  propertyImagesSection.style.display = "none";
  propertyMaxPeo.style.display = "block";
}

function proImagesLeftArrow() {
  const propertyLocationSection = document.querySelector(".property-location");
  const propertyImagesSection = document.querySelector(".property-images");
  propertyImagesSection.style.display = "none";
  propertyLocationSection.style.display = "block";
}

function proMaxPeoRightArrow() {
  const propertyMaxPeo = document.querySelector(".property-maxPeo");
  const propertyPriceSection = document.querySelector(".property-price");
  propertyMaxPeo.style.display = "none";
  propertyPriceSection.style.display = "block";
}

function proMaxPeoLeftArrow() {
  const propertyImagesSection = document.querySelector(".property-images");
  const propertyMaxPeo = document.querySelector(".property-maxPeo");
  propertyMaxPeo.style.display = "none";
  propertyImagesSection.style.display = "block";
}

function proPriceRightArrow() {
  const propertyPriceSection = document.querySelector(".property-price");
  const propertyNameSection = document.querySelector(".property-name");
  propertyPriceSection.style.display = "none";
  propertyNameSection.style.display = "block";
}

function proPriceLeftArrow() {
  const propertyPriceSection = document.querySelector(".property-price");
  const propertyMaxPeo = document.querySelector(".property-maxPeo");
  propertyPriceSection.style.display = "none";
  propertyMaxPeo.style.display = "block";
}
function proNameLeftArrow() {
  const propertyNameSection = document.querySelector(".property-name");
  const propertyPriceSection = document.querySelector(".property-price");
  propertyNameSection.style.display = "none";
  propertyPriceSection.style.display = "block";
}

function proNameRightArrow() {
  const propertyNameSection = document.querySelector(".property-name");
  const propertyDescriSection = document.querySelector(".property-description");
  propertyNameSection.style.display = "none";
  propertyDescriSection.style.display = "block";
}

function proDescLeftArrow() {
  const propertyNameSection = document.querySelector(".property-name");
  const propertyDescriSection = document.querySelector(".property-description");
  propertyDescriSection.style.display = "none";
  propertyNameSection.style.display = "block";
}

function increaseNum() {
  const maxPeople = document.querySelector(".maxPeopleInput");
  const inputPeople = document.querySelector(".maxPeopleInput");

  let peoplevalue = parseInt(maxPeople.value);
  inputPeople.value = peoplevalue + 1;
}

function decreaseNum() {
  const maxPeople = document.querySelector(".maxPeopleInput");
  const inputPeople = document.querySelector(".maxPeopleInput");

  let peoplevalue = parseInt(maxPeople.value);
  if (peoplevalue <= 0) {
    inputPeople.value = 0;
  } else {
    inputPeople.value = peoplevalue - 1;
  }
}
function colorClear() {
  const propertyApartment = document.getElementById("propertyApartment");
  const propertyHouse = document.getElementById("propertyHouse");
  const propertySpecialHouse = document.getElementById("propertySpecialHouse");
  const propertyBB = document.getElementById("propertyBB");
  const propertyUnique = document.getElementById("propertyUnique");
  const propertyHotel = document.getElementById("propertyHotel");

  propertyApartment.style.backgroundColor = "#ffffff";
  propertyHouse.style.backgroundColor = "#ffffff";
  propertySpecialHouse.style.backgroundColor = "#ffffff";
  propertyBB.style.backgroundColor = "#ffffff";
  propertyUnique.style.backgroundColor = "#ffffff";
  propertyHotel.style.backgroundColor = "#ffffff";
}


function propertySelect(event) {
  //   const properties = document.querySelector(".propertyInput-container").input;
  //   let property = properties.getAttribute("name");
  //   console.log(property);
  const propertyApartment = document.getElementById("propertyApartment");
  const propertyHouse = document.getElementById("propertyHouse");
  const propertySpecialHouse = document.getElementById("propertySpecialHouse");
  const propertyBB = document.getElementById("propertyBB");
  const propertyUnique = document.getElementById("propertyUnique");
  const propertyHotel = document.getElementById("propertyHotel");
  const hostForm = document.querySelector(".hostForm");

  //   console.log(event.target.name);
  let etName = event.target.className;

  console.log(etName);
  switch (etName) {
    case "propertyApartment":
	  hostForm.reset();
      colorClear();
      propertySpecialHouse.style.backgroundColor = "#eeeeee";
      propertyHouse.style.backgroundColor = "#eeeeee";
      propertyBB.style.backgroundColor = "#eeeeee";
      propertyUnique.style.backgroundColor = "#eeeeee";
      propertyHotel.style.backgroundColor = "#eeeeee";
      break;
    case "propertyHouse":
      hostForm.reset();
      colorClear();
      propertyApartment.style.backgroundColor = "#eeeeee";
      propertySpecialHouse.style.backgroundColor = "#eeeeee";
      propertyBB.style.backgroundColor = "#eeeeee";
      propertyUnique.style.backgroundColor = "#eeeeee";
      propertyHotel.style.backgroundColor = "#eeeeee";
      break;
    case "propertySpecialHouse":
      colorClear();
      propertyApartment.style.backgroundColor = "#eeeeee";
      propertyHouse.style.backgroundColor = "#eeeeee";
      propertyBB.style.backgroundColor = "#eeeeee";
      propertyUnique.style.backgroundColor = "#eeeeee";
      propertyHotel.style.backgroundColor = "#eeeeee";
      break;
    case "propertyBB":
      colorClear();
      propertyApartment.style.backgroundColor = "#eeeeee";
      propertyHouse.style.backgroundColor = "#eeeeee";
      propertySpecialHouse.style.backgroundColor = "#eeeeee";
      propertyUnique.style.backgroundColor = "#eeeeee";
      propertyHotel.style.backgroundColor = "#eeeeee";
      break;
    case "propertyUnique":
      colorClear();
      propertyApartment.style.backgroundColor = "#eeeeee";
      propertyHouse.style.backgroundColor = "#eeeeee";
      propertySpecialHouse.style.backgroundColor = "#eeeeee";
      propertyBB.style.backgroundColor = "#eeeeee";
      propertyHotel.style.backgroundColor = "#eeeeee";
      break;
    case "propertyHotel":
      colorClear();
      propertyApartment.style.backgroundColor = "#eeeeee";
      propertyHouse.style.backgroundColor = "#eeeeee";
      propertySpecialHouse.style.backgroundColor = "#eeeeee";
      propertyUnique.style.backgroundColor = "#eeeeee";
      propertyBB.style.backgroundColor = "#eeeeee";
      break;
    default:
  }
  return etName;
}

/**
 * 
 */