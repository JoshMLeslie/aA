console.log("Hello from the JavaScript console!");

const fetchWeather = () => {
  $.ajax({
    type: "GET",
    url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
    success(data) {
      console.log("TAKE THE DATA. TAKE IT.");
      printWeather(data);
      console.log("Good.");
    },
    error() {
      console.error("I'll warn you now, it's not good news. The sky is falling.");
    }

  });
};

console.log("doing a thing");

data = fetchWeather();
console.log("doing another thing that finishes before the function call because async");
// Add another console log here, outside your AJAX request


function printWeather(data) {
  // let parseData = JSON.stringify(data);
  // debugger
  // let lonLat = JSON.stringify(data.coord);
  // let weather = JSON.stringify(data.weather);
  // let base = JSON.stringify(data.base);
  // let cloudCount = JSON.stringify(data.clouds);
  let mainDat = JSON.stringify(data.main).split(",");

  $('#city').append(JSON.stringify(data.name));

  const $wc = $('#weather-channel');
  mainDat.forEach ((el) => {
    let $li = $("<li>");
    $li.text(el);
    $wc.append($li);
  });
}
