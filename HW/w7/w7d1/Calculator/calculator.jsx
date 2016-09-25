
import React from 'react';

class Calculator extends React.Component{
	constructor(props){
		super(props);
		this.state = {num1: "", num2: "", result: 0};
		this.setNum1 = this.setNum1.bind(this);
		this.setNum2 = this.setNum2.bind(this);
		this.addNum = this.addNum.bind(this);
		this.subNum = this.subNum.bind(this);
		this.divNum = this.divNum.bind(this);
		this.multNum = this.multNum.bind(this);
		this.clear = this.clear.bind(this);
	}

	addNum(){
		const result = parseInt(this.state.num1) + parseInt(this.state.num2);
		this.setState({result});
	}

	subNum(){
		const result = parseInt(this.state.num1) - parseInt(this.state.num2);
		this.setState({result});
	}

	multNum(){
		const result = parseInt(this.state.num1) * parseInt(this.state.num2);
		this.setState({result});
	}

	divNum(){
		const result = parseInt(this.state.num1) / parseInt(this.state.num2);
		this.setState({result});
	}

	clear(){
		const num1 = "";
		const num2 = "";
		const result = 0;
		this.setState({
			num1,
			num2,
			result
		});
	}

	setNum1(e){
		const num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num1 });
	}

	setNum2(e){
		const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num2 });
	}

	render(){
		return (
			<div>
				<input onChange={this.setNum1} value={this.state.num1}/>
				<input onChange={this.setNum2} value={this.state.num2}/>
				<h1>{this.state.result}</h1>
				<button value="clear" onClick={this.clear}>Clear</button>
				<button value="+" onClick={this.addNum}>+</button>
				<button value="-" onClick={this.subNum}>-</button>
				<button value="*" onClick={this.multNum}>*</button>
				<button value="/" onClick={this.divNum}>/</button>
			</div>
		);
	}
}

export default Calculator;
