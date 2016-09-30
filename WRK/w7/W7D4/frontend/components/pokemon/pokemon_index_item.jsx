import React from 'react';
import { withRouter } from 'react-router';

class PokemonIndexItem extends React.Component {
  constructor(props) {
    super(props);
    this.clickHandler = this.clickHandler.bind(this);
  }

  clickHandler() {
    this.props.router.push(`/pokemon/${this.props.id}`);
  }

  render() {
    return (
      <li className="pokemon-index-item" key={this.props.id} onClick={this.clickHandler}>

        <span>{this.props.pokemon.id}</span>
        <img src={this.props.pokemon.image_url} alt={this.props.pokemon.name} />
        <span>{this.props.pokemon.name}</span>


      </li>
    );
  }
}


export default withRouter(PokemonIndexItem);
