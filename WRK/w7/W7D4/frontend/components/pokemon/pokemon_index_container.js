import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index';
import { receiveAllPokemon, requestAllPokemon } from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: state.pokemon
});

const mapDispatchToProps = dispatch => ({

});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);
