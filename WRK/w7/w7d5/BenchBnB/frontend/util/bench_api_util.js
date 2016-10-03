export const fetchBenches = (success) => {
  $.ajax({
    method: "GET",
    url: "api/benches",
    success,
    error: (error) => console.log(error)
  });
};
