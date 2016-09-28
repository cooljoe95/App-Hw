import React from 'react';

const WeatherClock = ({ date, time }) => {
  return(
    <section>
      <h1>Date:</h1>
      <li> {date} </li>
      <h1>Time:</h1>
      <li> {time} </li>
    </section>
  );
}

export default WeatherClock;
