import React from 'react';
import  PokemonIndexItem  from './pokemon_index_item';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
  }

  render(){
    // debugger
    let pokemons = this.props.pokemon.map((pokemon) => {
      // debugger
      return <PokemonIndexItem pokemon={pokemon} key={pokemon.id} id={pokemon.id}  name={pokemon.name} />;
      });
    return (
      <section className="pokedex">
        <ul>
          {pokemons}
        </ul>
      </section>
    );

  }

}

export default PokemonIndex;
