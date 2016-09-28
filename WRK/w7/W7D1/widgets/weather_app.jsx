import React from 'react';
import WeatherClock from './weather_clock';
import WeatherGetter from './weather_getter';

export default class Weather extends React.Component{
  constructor (props){
    super(props);
    this.state = { date: new Date(), temp:"", city:"" };
    this.dateMaker = this.dateMaker.bind(this);
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount(){
    this.dateMaker();
    this.getLoc();
  }

  dateMaker() {
    setInterval(()=>
      {this.setState({date: new Date()});}, 1000);
  }

  getLoc(){
    const pos = [];
    navigator.geolocation.getCurrentPosition(function(position){
      pos.push(position.coords.latitude);
      pos.push(position.coords.longitude);
      this.getWeather(pos);
    }.bind(this));
  }

  getWeather(pos){
    const request = new XMLHttpRequest();

    request.addEventListener("load", (data) => {
      const parsedData = JSON.parse(data.currentTarget.responseText);
      this.setState({city: parsedData.name, temp: Math.floor(parsedData.main.temp - 273.15)});
    });

    request.open("GET", `http://api.openweathermap.org/data/2.5/weather?lat=${pos[0]}&lon=${pos[1]}&appid=bcb83c4b54aee8418983c2aff3073b3b`);
    request.send();
  }

  render () {
    return (
      <div>
        <ul>
          <li>
            <WeatherClock
              date={this.state.date.toDateString()}
              time={this.state.date.toTimeString()}
              />
          </li>
          <li>
            <WeatherGetter
              city={this.state.city} temp={this.state.temp}
            />
          </li>

        </ul>
     </div>
   );
  }
}
