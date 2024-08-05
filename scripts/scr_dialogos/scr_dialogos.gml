
function textos_dialogos() {
	switch nick_npc {
		case "jangadeiro0":
			ds_grid_add_dialogo("Ei Chico, está chegando a hora. Precisamos achar os outros irmãos pra prosseguir nossa luta.",1,"Jangadeiro Pedro");
			ds_grid_add_dialogo("Irei até eles. Não entrarão mais escravos no Porto das Correntes.",0,"Chico");
			ds_grid_add_dialogo("Confio em você. Boa sorte!",1,"Jangadeiro Pedro");
			break;
		case "jangadeiro0 salvo":
			ds_grid_add_dialogo("Como anda a pesca?",1,"Jangadeiro Pedro");
			break;
		
		case "jangadeiro1":
			ds_grid_add_dialogo("Ok, Chico. Estarei contigo. Vamos nessa.",1,"Jangadeiro Raimundo");
			break;
		case "jangadeiro1 salvo":
			ds_grid_add_dialogo("Vamos nessa.",1,"Jangadeiro Raimundo");
			break;
		
		case "jangadeiro2":
			ds_grid_add_dialogo("Depois disso tudo passar, vamo ter que assar um peixinho lá em casa.",1,"Jangadeiro João");
			break;
		case "jangadeiro2 salvo":
			ds_grid_add_dialogo("Depois disso tudo passar, vamo ter que assar um peixinho lá em casa.",1,"Jangadeiro João");
			break;
		
		case "jangadeiro3":
			ds_grid_add_dialogo("Estou pronto. Bora!",1,"Jangadeiro Eurico");
			break;
		case "jangadeiro3 salvo":
			ds_grid_add_dialogo("Bora!",1,"Jangadeiro Eurico");
			break;
		
		case "jangadeiro4":
			ds_grid_add_dialogo("Estou pronto. Bora!",1,"Jangadeiro Antônio");
			break;
		case "jangadeiro4 salvo":
			ds_grid_add_dialogo("Bora!",1,"Jangadeiro Antônio");
			break;
		
		case "Final Jogo":
			ds_grid_add_dialogo("'Esses homens que só pensam na própria riqueza, na própria terra, no próprio luxo em cima de nós terão a resposta que merecem.' - Chico",1,"Chico");
			ds_grid_add_dialogo("Após se agrupar com os jangadeiros e todo seu povo, unidos pelo desejo de justiça, sangue e rebeldia contra a opressão dos escravocratas, Chico os lidera em prol da quebra das correntes.",0,"Chico");
			ds_grid_add_dialogo("'Tenho numa pele a alma dos injustiçados, aviltados, depreciados, desmerecidos e sofridos, dentro de mim. Por isso, talvez, não seja de leveza constatável, apreciável e saboreável, como são as frutas leves da estação.' - Castro Alves",0,"Chico");
			ds_grid_add_dialogo("Sob a liderança de Chico da Matilde, os trabalhadores do mar paralisaram as atividades em recusa à embarcação de qualquer negro como mercadoria nos navios, fechando o porto das Correntes.",0,"Chico");
			ds_grid_add_dialogo("O movimento abolicionista ganhou força desde então e fez com que um dos líderes, Chico, entrasse para a história como Dragão do Mar.",0,"Chico");
			ds_grid_add_dialogo("Os inimigos não ficaram satisfeitos com toda a implicação de seus subordinados e foram à luta para lidar com tamanha rebeldia.",0,"Chico");
			ds_grid_add_dialogo("Porém, a liderança fundamental de Chico, levando seu povo para pontos estratégicos, manifestações, fugas e revoltas em diversos locais que mantinham os seus similares em estado deprimente, tornou possível o desenvolvimento e o fim da escravidão em sua província, sendo a cidade pioneira a dar fim a ela.",0,"Chico");
			ds_grid_add_dialogo("Sua rebeldia inspirou outras cidades ao redor da pátria, que, alguns anos depois, também aboliram a escravatura.",0,"Chico");
			ds_grid_add_dialogo("Não se sabe o destino da jangada emblemática, mas ela perdura como um símbolo e testemunho da bravura e memória coletiva na história: a Liberdade.",1,"Chico");
			break;
	}
}