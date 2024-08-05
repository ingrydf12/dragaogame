#region ENUMS
enum Sprites {
	Idle,
	Walk,
	Jump,
	Attack,
	Altura
}
#endregion ENUMS

//CONTROLE
#macro AXIS_DEADZONE 0.25
global.gamepad_id = noone;

//GLOBAIS
global.pause = false;
global.debug = false;
global.dialogo = false;
global.cutscene = false;
global.checkpoint = noone;

//MISSÕES
global.jangadeiros_achados = 0;