var Switch = React.createClass({

  handleClick: function(event){
    this.props.onButtonClick({id: this.props.id, room: this.props.room, on: !this.props.on});
  },

  render: function() {
    var activeClass = this.props.on ? 'switch active' : 'switch';
    var colour = this.props.on? '#'+ this.props.colour : '#444';
    var btnStyle = {background: colour};

    return (
      <div className="room">
        <p className="switch-label">
          {this.props.room}
        </p>
        <span onClick={this.handleClick} className={activeClass} style={btnStyle}/>
      </div>
    );
  }
});
