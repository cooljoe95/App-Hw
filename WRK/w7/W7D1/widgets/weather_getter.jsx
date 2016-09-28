import React from 'react';
const WeatherGetter = ({ city, temp }) => {
  return (
    <div>
      <h1>{city}</h1>
      <h2>{temp} Celsius</h2>
    </div>
  )
  ;};

export default WeatherGetter;
