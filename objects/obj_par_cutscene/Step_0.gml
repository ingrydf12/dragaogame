
var current_action = cutscene[action];
var action_lenght = array_length(current_action)-1;

switch action_lenght {
	default: //0
		script_execute(current_action[0]);
		break;
	case 1: //0
		script_execute(current_action[0],current_action[1]);
		break;
	case 2:
		script_execute(current_action[0],current_action[1],current_action[2],);
		break;
	case 3:
		script_execute(current_action[0],current_action[1],current_action[2],current_action[3]);
		break;
	case 4:
		script_execute(current_action[0],current_action[1],current_action[2],current_action[3],current_action[4]);
		break;
}