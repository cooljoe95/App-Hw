import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index';
import { requestSinglePokemon } from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: state.detailPokemon
});

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (pokemon) => {
    return dispatch(requestSinglePokemon(pokemon.id));
  }
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
