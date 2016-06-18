var SwitchGroup = React.createClass({

  getInitialState: function() {
    return { rooms: this.props.data };
  },

  loadRoomsFromServer: function() {
    $.ajax({
      url: '/lights',
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({rooms: JSON.stringify(data) });
      }.bind(this),
      error: function(xhr, status, err){
        console.error('/lights', status, err.toString());
      }.bind(this)
    });
  },
  postRoomToServer: function(room){
    $.ajax({
      url: '/lights/update',
      dataType: 'json',
      type: 'PUT',
      data: room,
      success: function(data){
        console.log(data);
      }.bind(this),
      error: function(xhr, status, err){
        console.error('/lights/update', status, err.toString());
      }.bind(this)
    });
  },

  componentDidMount: function() {
    this.loadRoomsFromServer();
    setInterval(this.loadRoomsFromServer, this.props.pollInterval);
  },

  handleButtonClick: function(room) {
    var oldRooms = JSON.parse(this.state.rooms);
    $.each(oldRooms, function() {
      if(this.id == room.id){
        this.on = room.on;
        room.id = this.id;
      }
    });
    this.setState({rooms: JSON.stringify(oldRooms)});
    this.postRoomToServer(room);
  },

  render: function() {
    var rooms = JSON.parse(this.state.rooms);
    var switchNodes = rooms.map(function(btn) {
      return (
        <Switch key={btn.id} id={btn.id} room={btn.name} on={btn.on} colour={btn.colour} onButtonClick={this.handleButtonClick}/>
      );
    }, this);
    return (
      <div>
        <div className="rooms">
          {switchNodes}
        </div>
      </div>
    );
  }
});
