export const REQUEST_BENCHES = "REQUEST_BENCHES";
export const RECEIVE_BENCHES = "RECEIVE_BENCHES";

export const requestBenches = () => {
  return {
    type: REQUEST_BENCHES
  };
};

export const receiveBenches = (benches) => {
  return {
    type: RECEIVE_BENCHES,
    benches
  };
};
