export const fetchAllPokemon = (success, error) => {
  $.ajax({
    url: "/api/pokemon",
    method: "GET",
    dataType: "json",
    success: success,
    error: error
  });
};

export const fetchSinglePokemon = (pokemon, success, error) => {
  $.ajax({
    method: "GET",
    url: `/api/pokemon/${pokemon.id}`,
    dateType: 'json',
    success: success,
    error: error
  });
};
