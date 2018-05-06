// import React from 'react';
//
// export default class Weather extends React.Component {
//   constructor (props){
//     super(props);
//     this.weather = null;
//
//   }
//
//   componentDidMount() {
//     const location = navigator.geolocation.getCurrentPosition();
//     let data = [];
//
//     if ("geolocation" in location) {
//       navigator.geolocation.getCurrentPosition((ret) => this.weather = ret);
//         // const result = {};
//         // navigator.geolocation.getCurrentPosition((ret) => result = ret);
//         // result => blahblahblah
//
//
//         // $.ajax({
//         //   type: 'GET',
//         //   url: 'http://api.openweathermap.org/data/2.5/weather' +
//         //   	'?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b',
//         //   success(data) {
//         //     console.log("We have your weather!")
//         //     console.log(data);
//         //   },
//         //   error() {
//         //     console.error("An error occurred.");
//         //   },
//         // });
//
//       // });
//     } else {
//       alert("location bananas");
//     }
//   }
//
//   render () {
//     debugger
//      return (
//        <p>
//        {this.weather}
//      </p>
//    );
//   }
// }
