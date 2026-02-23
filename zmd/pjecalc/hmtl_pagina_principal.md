<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="expires" content="-1" />
	
		<link class="component" href="/pjecalc/a4j/s/3_3_3.Finalorg/richfaces/renderkit/html/css/basic_classes.xcss/DATB/eAELKhNYFrp8hjQADgQDLg__" rel="stylesheet" type="text/css" /><link class="component" href="/pjecalc/a4j/s/3_3_3.Finalorg/richfaces/renderkit/html/css/extended_classes.xcss/DATB/eAELKhNYFrp8hjQADgQDLg__" media="rich-extended-skinning" rel="stylesheet" type="text/css" /><script src="/pjecalc/a4j/g/3_3_3.Finalorg.ajax4jsf.javascript.AjaxScript" type="text/javascript"></script><link class="component" href="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/css/msg.css" rel="stylesheet" type="text/css" /><link class="component" href="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/css/msgs.css" rel="stylesheet" type="text/css" /><script src="/pjecalc/a4j/g/3_3_3.Finalorg.ajax4jsf.javascript.PrototypeScript" type="text/javascript"></script><script src="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/scripts/utils.js" type="text/javascript"></script><script src="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/scripts/browser_info.js" type="text/javascript"></script><script src="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/scripts/modalPanel.js" type="text/javascript"></script><script src="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/scripts/modalPanelBorders.js" type="text/javascript"></script><link class="component" href="/pjecalc/a4j/s/3_3_3.Finalorg/richfaces/renderkit/html/css/modalPanel.xcss/DATB/eAELKhNYFrp8hjQADgQDLg__" rel="stylesheet" type="text/css" /><script src="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/scripts/jquery/jquery.js" type="text/javascript"></script><script src="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/scripts/jquery.hotkeys.js" type="text/javascript"></script><script src="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/scripts/hotKey.js" type="text/javascript"></script><script src="/pjecalc/a4j/g/3_3_3.Finalorg/ajax4jsf/javascript/scripts/form.js" type="text/javascript"></script><script type="text/javascript">window.RICH_FACES_EXTENDED_SKINNING_ON=true;</script><script src="/pjecalc/a4j/g/3_3_3.Finalorg/richfaces/renderkit/html/scripts/skinning.js" type="text/javascript"></script><link rel="SHORTCUT ICON" href="/pjecalc/images/favi_icon.gif" />
		<title>PJe-Calc - Sistema de C&aacute;lculos Trabalhistas</title>
	
		<link rel="stylesheet" type="text/css" href="/pjecalc/css/logon.css?2.15.1" />
		<link rel="stylesheet" type="text/css" href="/pjecalc/css/principal.css?2.15.1" />
		<link rel="stylesheet" type="text/css" href="/pjecalc/css/conteudo.css?2.15.1" />
		<link rel="stylesheet" type="text/css" href="/pjecalc/css/jquery.alerts.css?2.15.1" />
		<link rel="stylesheet" type="text/css" href="/pjecalc/css/tipsy.css?2.15.1" />
		<link rel="stylesheet" type="text/css" href="/pjecalc/css/menuesquerdo.css?2.15.1" />

	<style type="text/css">


	    div, th, label{
            font-size:  !important; 
        }


		#main{
			background-image: url("/pjecalc/styleSkinInfox/azul/imagens/img_bgCorpo.png");
			background-color:#B0D2DD ;		
			background-position: right top;
			background-repeat: repeat-y;	
		}
		
		
		select, input, textarea{
			background-color:#EBF1F8;
		}		
		
		.botao, .botaoMedio, .botaoGrande, .botaoLivre {
			background: #5578AB;
			background-image: -webkit-linear-gradient(top, #5578AB, #415278);
			background-image: -moz-linear-gradient(top, #5578AB, #415278);
			background-image: -ms-linear-gradient(top, #5578AB, #415278);
			background-image: -o-linear-gradient(top, #5578AB, #415278);
			background-image: linear-gradient(to bottom, #5578AB, #415278);
		}
			
		.modPesqEsq{ 
		    width: 38px;
			height: 25px;
			margin-top:0px;
		    background-image: url("/pjecalc/styleSkinInfox/azul/imagens/imgBgPes1.png");
			background-repeat:no-repeat;
		}
		
		#versaopesquisa input {
			background-color: unset;
			border: unset;
		}
		
		#versaopesquisa input:focus {
		    box-shadow: unset;
		    -webkit-box-shadow: unset; 
		    -moz-box-shadow: unset;
		    border: unset; 
		}
		
		.modPesqBg{
		    background-image: url("/pjecalc/styleSkinInfox/azul/imagens/imgBgPes2.png");
			background-repeat:repeat-x;
			background-color: unset;
		}
		
		.modPesqInputText{
		    border: 0px;			    				    
		    width:134px;
		    height: 16px;		   
		    background-color: transparent;
		    background-image: url("/pjecalc/styleSkinInfox/azul/imagens/img_textPesq.png");
		    background-repeat: no-repeat;
		    background-position: unset;			    
		    font-size: 11px; 
		    color: white;
		    padding-left:3px;			    
		}	
		
		.required {
			color: red;
			padding-left: 2px;
		}
		
		#papeisUsuarioForm option {
			background-color: #ECF4FE;
			color: #57627E;
			text-align: left;
		}
		
		.acessibilidade {
			font-size: 0.1em;
		    left: -10000px;
		    line-height: 1%;
		    position: absolute;
		    top: -10000px;
		}
		
		option {
			background-color: #EBF1F8;
		}
		
		option:hover {
			box-shadow: 0 0 10px 100px #b2c7e8 inset;
		}
		
		option:checked {
			box-shadow: 0 0 10px 100px #b2c7e8 inset;
		}
		
		input[type='submit'],input[type='button'], .buttons {
			border: solid 1px #C2E9F3;
		}

		textarea, select {
			border: 1px solid #C2E9F3;
			background:#EBF1F8;
		}

		.required {
			color: red;
		}
		
		/*** lista de cálculos recentes ***/
		.listaCalculosRecentes option{
			color: #283D5B;
		}

		.listaCalculosRecentes option:hover{
			background-color: #b2c7e8;
		}
		
				
		/*** TABELA ***/
		.dr-table-caption{
			background: #FFFFFF;
			border-bottom: 1px solid #C0C0C0;
		}	
		
		.dr-table-headercell {
			border-bottom:0px solid #C0C0C0;
			border-left:0px solid #C0C0C0;
			border-top:0px solid #C0C0C0;
		}
		
		.dr-table{
			border: #C0C0C0;
		}
		
		.dr-table-footer {
		    background-color: #cccccc;
		}
				
		.dr-table-cell{
			border-bottom:	#C0C0C0;
			border-right:	#C0C0C0;
			border-left:	#C0C0C0;
			border-top:		#C0C0C0;
		}
		
		.dr-table-subheader {
			background: #FFFFFF;
		}
		
		.gradeTabela {
			border:	#C0C0C0;
		}
		
		.cabecalhoTabela {
			background: #FFFFFF;
		}
		
		.linha-par:hover, .linha-impar:hover{ background: #b2c7e8; }

		#menupainel li ul li:hover {
			background: #b2c7e8; 
		}
		
		#topo{
			background-image: url("/pjecalc/styleSkinInfox/azul/imagens/top_background.jpg");
		}

		/* Botoes pagina PRINCIPAL */
		.sprite-criar a { background: url("/pjecalc/styleSkinInfox/azul/imagens/bt_new_calc.png") }
		.sprite-criar a:hover { background: url("/pjecalc/styleSkinInfox/azul/imagens/bt_new_calc_hover.png") }
		.sprite-criar a:focus { background: url("/pjecalc/styleSkinInfox/azul/imagens/bt_new_calc_hover.png") }
		
		.sprite-abrir a { background: url("/pjecalc/styleSkinInfox/azul/imagens/bt_open_calc.png") }
		.sprite-abrir a:hover { background: url("/pjecalc/styleSkinInfox/azul/imagens/bt_open_calc_hover.png") }
		.sprite-abrir a:focus {background: url("/pjecalc/styleSkinInfox/azul/imagens/bt_open_calc_hover.png") }
		
		.sprite-importar a { background: url("/pjecalc/styleSkinInfox/azul/imagens/bt_import_calc.png") }
		.sprite-importar a:hover {background: url("/pjecalc/styleSkinInfox/azul/imagens/bt_import_calc_hover.png") }
		.sprite-importar a:focus {background: url("/pjecalc/styleSkinInfox/azul/imagens/bt_import_calc_hover.png") }

		.conteudoPrincipal { background: url("/pjecalc/styleSkinInfox/azul/imagens/splash_background.jpg") no-repeat; }
		
		/* Retirados do arquivo: logon.css */
		#logon{
		    background-color: #2D4D7C; 
		}	
		
		#lateral, #lateralUS {
			background-image: url("/pjecalc/styleSkinInfox/azul/imagens/login/login_screen.jpg")
		}
		
		.bt_logon {
			background: transparent url("/pjecalc/styleSkinInfox/azul/imagens/login/bt_logon.png");
			border: 0px !important;
		}
		
		.bt_logon:hover {
			background: transparent url("/pjecalc/styleSkinInfox/azul/imagens/login/bt_logon_hover.png");
			border: 0px !important;
		}
		
		.bt_logond {
			background: #415278 !important;
			background-image: -webkit-linear-gradient(top, #415278, #5578AB) !important;
			background-image: -moz-linear-gradient(top, #415278, #5578AB) !important;
			background-image: -ms-linear-gradient(top, #415278, #5578AB) !important;
			background-image: -o-linear-gradient(top, #415278, #5578AB) !important;
			background-image: linear-gradient(to bottom, #415278, #5578AB) !important;
			border: solid #455B80 2px !important;
		}
		
		.bt_logond:hover {
		  background: #283d61 !important;
		  background-image: -webkit-linear-gradient(top, #283d61, #4b73ab) !important;
		  background-image: -moz-linear-gradient(top, #283d61, #4b73ab) !important;
		  background-image: -ms-linear-gradient(top, #283d61, #4b73ab) !important;
		  background-image: -o-linear-gradient(top, #283d61, #4b73ab) !important;
		  background-image: linear-gradient(to bottom, #283d61, #4b73ab) !important;
		}
		
		.bt_pequeno {
		  background: #5578AB !important;
		  background-image: -webkit-linear-gradient(top, #5578AB, #415278) !important;
		  background-image: -moz-linear-gradient(top, #5578AB, #415278) !important;
		  background-image: -ms-linear-gradient(top, #5578AB, #415278) !important;
		  background-image: -o-linear-gradient(top, #5578AB, #415278) !important;
		  background-image: linear-gradient(to bottom, #5578AB, #415278) !important;
		}
		
		.bt_pequeno:hover {
		  background: #4b73ab !important;
		  background-image: -webkit-linear-gradient(top, #4b73ab, #283d61) !important;
		  background-image: -moz-linear-gradient(top, #4b73ab, #283d61) !important;
		  background-image: -ms-linear-gradient(top, #4b73ab, #283d61) !important;
		  background-image: -o-linear-gradient(top, #4b73ab, #283d61) !important;
		  background-image: linear-gradient(to bottom, #4b73ab, #283d61) !important;
		  text-decoration: none !important;
		  border: solid #455B80; 2px !important;
		}
				
		
		#modalBoxAmb{
			background-image: url("/pjecalc/styleSkinInfox/azul/imagens/login/modalBox_Ambiente.png");
		}

		#modalBoxAssinador{
			background-image: url("/pjecalc/styleSkinInfox/azul/imagens/login/modalBox_Ambiente.png");
			
		}
		
		#modalBoxErroConexao{
			background-image: url("/pjecalc/styleSkinInfox/azul/imagens/login/modalBox_Ambiente.png");
		}
		
		#modalBoxReq{
			background-image: url("/pjecalc/styleSkinInfox/azul/imagens/login/modalBox_Requisito.png");
		}	
		
		/* Link "Sobre" da página principal */
		#modalBox{
			background-image: url("/pjecalc/styleSkinInfox/azul/imagens/modalBox_back.jpg");
		}
							
		
	</style>
		
	</head>

	<body>
<form id="formulario" name="formulario" method="post" action="/pjecalc/pages/principal.jsf" enctype="">
<input type="hidden" name="formulario" value="formulario" />
	
		
			<a name="irTopoPagina"></a>
			<div id="main">
				<div id="topo">								
					<div id="logo">
<script type="text/javascript" language="Javascript">function dpf(f) {var adp = f.adp;if (adp != null) {for (var i = 0;i < adp.length;i++) {f.removeChild(adp[i]);}}};function apf(f, pvp) {var adp = new Array();f.adp = adp;var i = 0;for (k in pvp) {var p = document.createElement("input");p.type = "hidden";p.name = k;p.value = pvp[k];f.appendChild(p);adp[i++] = p;}};function jsfcljs(f, pvp, t) {apf(f, pvp);var ft = f.target;if (t) {f.target = t;}f.submit();f.target = ft;dpf(f);};</script>
<a href="#" accesskey="1" onclick="if(typeof jsfcljs == 'function'){jsfcljs(document.getElementById('formulario'),{'formulario:j_id10':'formulario:j_id10'},'');}return false">
							<img src="/pjecalc/styleSkinInfox/azul/imagens/top_final.jpg" height="40" width="699" border="0" alt="imagem do topo da p&aacute;gina" /></a>
					</div>
					<div id="versaopesquisa">
							<table id="tbPesquisa" cellspacing="0" cellpadding="0" style="vAlign: middle">
								<tr>
								    <td>
								    </td>
								    <td><span id="formulario:versaoSistema">Vers&atilde;o: 2.15.1</span>
								    </td>
								    <td class="modPesqEsq">
								    </td>		        
							     	<td class="modPesqBg"> 
								        <span style="font-size: 11px; color: #FFFFFF; font-weight: bold;">
										    Pesquisar
										</span><input id="formulario:searchText" type="text" name="formulario:searchText" class="modPesqInputText" accesskey="0" alt="Atalho: alt + 0 ou alt + shift + 0" onblur="escondeSelectPesquisa('selAcheFacil');" onfocus="limpaCampoPesquisa(this,'selAcheFacil', event);" onkeypress="return isResultadosPesquisaMenuVazio('selAcheFacil') || !isApertouEnter(event);" onkeyup="return saltaParaSelect(this,'selAcheFacil',event);" tabindex="1000" title="Pesquisa de menu" />
										<select tabindex="1001" onkeydown="pressionouTeclaNoSelect(this,event);" onclick="clicarItemMenu(this);" style="z-index:1002; background-color: rgb(239, 239, 239); border: 1px solid rgb(187, 187, 187); color: rgb(31, 79, 119); left: -255px; font: 11px Arial; height: 104px; padding: 0pt 0pt 4px 3px; top: 27px; width: 529px; position: absolute; display: none;" title="Selecione um dos itens do menu" size="1" name="selAcheFacil" id="selAcheFacil"></select>
								    </td>	          
							     	<td class="modPesqBg"><input id="formulario:searchTextBt" name="formulario:searchTextBt" onclick="if (jQuery('.modPesqInputText').val().length == 0) {event.preventDefault(); return false;};A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:searchTextBt','containerId':'formulario:j_id13','parameters':{'formulario:searchTextBt':'formulario:searchTextBt'} } );return false;" alt="Pesquisa de documento" style="top:0px;" title="Pesquisa de documento" type="image" src="/pjecalc/styleSkinInfox/azul/imagens/imgPes.png" />
					                </td> 
							        <td class="modPesqBg" valign="top"><img id="formulario:paletaCoresBt" src="/pjecalc/images/accessibility/palette.gif" onclick="Richfaces.showModalPanel('skinPanel')" style="cursor:pointer" title="Alterar o esquema de cores" /><input id="formulario:zoomNormalBt" name="formulario:zoomNormalBt" onclick="A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:zoomNormalBt','containerId':'formulario:j_id13','oncomplete':function(request,event,data){location.reload()},'parameters':{'formulario:zoomNormalBt':'formulario:zoomNormalBt','ajaxSingle':'formulario:zoomNormalBt'} } );return false;" style="width: 17px; height: 21px;" type="image" src="/pjecalc/styleSkinInfox/azul/imagens/zoom-normal.png" /><input id="formulario:zoomMedioBt" name="formulario:zoomMedioBt" onclick="A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:zoomMedioBt','containerId':'formulario:j_id13','oncomplete':function(request,event,data){location.reload()},'parameters':{'formulario:zoomMedioBt':'formulario:zoomMedioBt','ajaxSingle':'formulario:zoomMedioBt'} } );return false;" style="width: 17px; height: 21px;" type="image" src="/pjecalc/styleSkinInfox/azul/imagens/zoom-medio.png" /><input id="formulario:zoomGdeBt" name="formulario:zoomGdeBt" onclick="A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:zoomGdeBt','containerId':'formulario:j_id13','oncomplete':function(request,event,data){location.reload()},'parameters':{'formulario:zoomGdeBt':'formulario:zoomGdeBt','ajaxSingle':'formulario:zoomGdeBt'} } );return false;" style="width: 17px; height: 21px;" type="image" src="/pjecalc/styleSkinInfox/azul/imagens/zoom-grande.png" />	
						        	</td>      
					    		</tr>
							</table>		
					</div>
					
					<div id="logoBanco"></div>								
					<div style="float: right; padding-right: 23px; margin-top:22px;">
					</div>
					<div id="bemVindo">
						<div id="usuario">
						</div>
					</div>	
				</div>
				
				<div id="divConfirm">
				</div>
	
				<div id="conteudo"><span id="_viewRoot:status"><span id="_viewRoot:status.start" aria-live="polite" style="display: none"></span><script type="text/javascript">
window.document.getElementById('_viewRoot:status.start').onstart=function(){AguardeShow();;};
</script><span id="_viewRoot:status.stop" aria-live="polite"></span><script type="text/javascript">
window.document.getElementById('_viewRoot:status.stop').onstop=function(){AguardeHide();;};
</script></span><span role="presentation" aria-live="none" aria-label=" " id="formulario:scriptMenu" summary=" ">

				<script type="text/javascript">
				
					jQuery(document).ready( function() {
						
						jQuery("input:text:visible:enabled:first").focus();
												
						jQuery('#menupainel .header').click(function() {
							var abrindo = !jQuery(this).next().is(":visible"); 

							jQuery(this).children("span").toggleClass("undock");								
							jQuery(this).next().slideToggle(function(){
							});
							
							if (abrindo) {
								jQuery('.item-aberto').children("span").toggleClass("undock");
								jQuery('.item-aberto').removeClass('item-aberto').next().slideToggle(function(){
								});
								jQuery(this).addClass('item-aberto');
							}
							else {
								jQuery('.item-aberto').removeClass('item-aberto');
							}
							
						});

				    	jQuery('#linkSetaOn').click(function() {
							jQuery("#conteudo").animate({marginLeft: "-240px", width:"117%"}, "slow");
							jQuery('#linkSetaOff').animate({marginRight: "-38px"}, "slow");
							jQuery('#linkSetaOn').hide();
							jQuery('#linkSetaOff').show();
							
							
							
						});
						
						jQuery('#linkSetaOff').click(function() {
							jQuery("#conteudo").animate({marginLeft: "0px", width:"100%" }, "slow");
							jQuery('#linkSetaOff').animate({marginRight: "0px"}, "slow");
					     	jQuery('#linkSetaOn').show();
							jQuery('#linkSetaOff').hide();
						
						});

						//Script para selecionar automaticamente o valor do input/textarea quando a tecla 
						//TAB for pressionada ou ocorrer um evento de de mouse click.
						jQuery("input[type='text'], textarea").live("keyup", function(e){
							   
							var code = e.keyCode || e.which;
							   if(code == '9'){
								   this.focus(); 
								   this.select();
								}      
					    });

						jQuery("input[type='text']").live("click", function(){							 
							   this.focus(); this.select();   
				        });
						
						jQuery("input[type='text']").live("focus", function(){							 
							   this.focus(); this.select();   
				        });
						
				        //Script para desabilitar o TAB para campos radio/checkbox/ e botão "excluir" dos grids.
						//jQuery("input[type='radio'], input[type='checkbox'], .linkExcluir").each(function(){
						//    this.tabIndex = -1;
						//});

					});
					
	

				</script></span>

			<div class="expandirRecolher">        
                <div class="bloco" style="width: 230px">            
                    <div id="linkSetaOn"></div>
                    <div id="linkSetaOff" style="display: none;"></div>
                    <span class="retrair">Retrair Menu</span>        
                </div>
                <div style="float:right; margin-right: 22px;">
                </div>
                
			</div>

			<table height="100%" border="0" cellspacing="0" cellpadding="0"> 
				<tr>
						
							
						<td width="230px" valign="top" id="menuesq"><span role="presentation" aria-live="none" aria-label=" " id="formulario:arvore" summary=" "><?xml version="1.0" encoding="ISO-8859-1"?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt" lang="pt"><span role="presentation" aria-live="none" aria-label=" " id="formulario:j_id36" summary=" ">
	<ul id="menupainel">
	    	<li class="header "><span class="dock "></span>C&aacute;lculo</li>
		    <li class="menu-item" style="display:none;">
			    <ul>
			    	<li id="li_tela_inicial"><a class="menuTelaPrincipal" href="#" id="formulario:j_id38:0:j_id41:0:j_id46" name="formulario:j_id38:0:j_id41:0:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:0:j_id41:0:j_id46','parameters':{'formulario:j_id38:0:j_id41:0:j_id46':'formulario:j_id38:0:j_id41:0:j_id46'} } );return false;">Tela Inicial</a>
				    </li>
			    	<li id="li_calculo_novo"><a class="menuImageNew" href="#" id="formulario:j_id38:0:j_id41:1:j_id46" name="formulario:j_id38:0:j_id41:1:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:0:j_id41:1:j_id46','parameters':{'formulario:j_id38:0:j_id41:1:j_id46':'formulario:j_id38:0:j_id41:1:j_id46'} } );return false;">Novo</a>
				    </li>
			    	<li id="li_calculo_externo_novo"><a class="menuImageNewCalculoExterno" href="#" id="formulario:j_id38:0:j_id41:2:j_id46" name="formulario:j_id38:0:j_id41:2:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:0:j_id41:2:j_id46','parameters':{'formulario:j_id38:0:j_id41:2:j_id46':'formulario:j_id38:0:j_id41:2:j_id46'} } );return false;">Novo C&aacute;lculo Externo</a>
				    </li>
			    	<li id="li_calculo_buscar"><a class="menuImageSearch" href="#" id="formulario:j_id38:0:j_id41:3:j_id46" name="formulario:j_id38:0:j_id41:3:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:0:j_id41:3:j_id46','parameters':{'formulario:j_id38:0:j_id41:3:j_id46':'formulario:j_id38:0:j_id41:3:j_id46'} } );return false;">Buscar</a>
				    </li>
			    	<li id="li_calculo_importar"><a class="menuImageImport" href="#" id="formulario:j_id38:0:j_id41:4:j_id46" name="formulario:j_id38:0:j_id41:4:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:0:j_id41:4:j_id46','parameters':{'formulario:j_id38:0:j_id41:4:j_id46':'formulario:j_id38:0:j_id41:4:j_id46'} } );return false;">Importar</a>
				    </li>
			    	<li id="li_processo_relatorio"><a class="menuImagePrint" href="#" id="formulario:j_id38:0:j_id41:5:j_id46" name="formulario:j_id38:0:j_id41:5:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:0:j_id41:5:j_id46','parameters':{'formulario:j_id38:0:j_id41:5:j_id46':'formulario:j_id38:0:j_id41:5:j_id46'} } );return false;">Relat&oacute;rio Consolidado</a>
				    </li>
				</ul>
		    </li>
	    	<li class="header "><span class="dock "></span>Tabelas</li>
		    <li class="menu-item" style="display:none;">
			    <ul>
			    	<li id="li_tabelas_salario_minimo"><a class="menuImageSalarioMinimo" href="#" id="formulario:j_id38:4:j_id41:0:j_id46" name="formulario:j_id38:4:j_id41:0:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:0:j_id46','parameters':{'formulario:j_id38:4:j_id41:0:j_id46':'formulario:j_id38:4:j_id41:0:j_id46'} } );return false;">Sal&aacute;rio M&iacute;nimo</a>
				    </li>
			    	<li id="li_tabelas_salario_categoria"><a class="menuImageSalarioCategoria" href="#" id="formulario:j_id38:4:j_id41:1:j_id46" name="formulario:j_id38:4:j_id41:1:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:1:j_id46','parameters':{'formulario:j_id38:4:j_id41:1:j_id46':'formulario:j_id38:4:j_id41:1:j_id46'} } );return false;">Pisos Salariais</a>
				    </li>
			    	<li id="li_tabelas_salario_familia"><a class="menuImageTabelaFamilia" href="#" id="formulario:j_id38:4:j_id41:2:j_id46" name="formulario:j_id38:4:j_id41:2:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:2:j_id46','parameters':{'formulario:j_id38:4:j_id41:2:j_id46':'formulario:j_id38:4:j_id41:2:j_id46'} } );return false;">Sal&aacute;rio-fam&iacute;lia</a>
				    </li>
			    	<li id="li_tabelas_seguro_desemprego"><a class="menuTabelaSeguroDesemprego" href="#" id="formulario:j_id38:4:j_id41:3:j_id46" name="formulario:j_id38:4:j_id41:3:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:3:j_id46','parameters':{'formulario:j_id38:4:j_id41:3:j_id46':'formulario:j_id38:4:j_id41:3:j_id46'} } );return false;">Seguro-desemprego</a>
				    </li>
			    	<li id="li_tabelas_vale_transporte"><a class="menuImageValeTransporte" href="#" id="formulario:j_id38:4:j_id41:4:j_id46" name="formulario:j_id38:4:j_id41:4:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:4:j_id46','parameters':{'formulario:j_id38:4:j_id41:4:j_id46':'formulario:j_id38:4:j_id41:4:j_id46'} } );return false;">Vale-transporte</a>
				    </li>
			    	<li id="li_tabelas_feriado"><a class="menuTabelaFeriado" href="#" id="formulario:j_id38:4:j_id41:5:j_id46" name="formulario:j_id38:4:j_id41:5:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:5:j_id46','parameters':{'formulario:j_id38:4:j_id41:5:j_id46':'formulario:j_id38:4:j_id41:5:j_id46'} } );return false;">Feriados e Pontos Facultativos</a>
				    </li>
			    	<li id="li_tabelas_verbas"><a class="menuImageTabela" href="#" id="formulario:j_id38:4:j_id41:6:j_id46" name="formulario:j_id38:4:j_id41:6:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:6:j_id46','parameters':{'formulario:j_id38:4:j_id41:6:j_id46':'formulario:j_id38:4:j_id41:6:j_id46'} } );return false;">Verbas</a>
				    </li>
			    	<li id="li_tabelas_inss"><a class="menuImageAliquotasInss" href="#" id="formulario:j_id38:4:j_id41:7:j_id46" name="formulario:j_id38:4:j_id41:7:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:7:j_id46','parameters':{'formulario:j_id38:4:j_id41:7:j_id46':'formulario:j_id38:4:j_id41:7:j_id46'} } );return false;">Contribui&ccedil;&atilde;o Social</a>
				    </li>
			    	<li id="li_tabela_irpf"><a class="menuImageAliquotasImpostoRenda" href="#" id="formulario:j_id38:4:j_id41:8:j_id46" name="formulario:j_id38:4:j_id41:8:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:8:j_id46','parameters':{'formulario:j_id38:4:j_id41:8:j_id46':'formulario:j_id38:4:j_id41:8:j_id46'} } );return false;">Imposto de Renda</a>
				    </li>
			    	<li id="li_tabelas_parametros_custas"><a class="menuParametrosCustas" href="#" id="formulario:j_id38:4:j_id41:9:j_id46" name="formulario:j_id38:4:j_id41:9:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:9:j_id46','parameters':{'formulario:j_id38:4:j_id41:9:j_id46':'formulario:j_id38:4:j_id41:9:j_id46'} } );return false;">Custas Judiciais</a>
				    </li>
			    	<li id="li_tabelas_indices_gerais"><a class="menuImageIndices" href="#" id="formulario:j_id38:4:j_id41:10:j_id46" name="formulario:j_id38:4:j_id41:10:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:10:j_id46','parameters':{'formulario:j_id38:4:j_id41:10:j_id46':'formulario:j_id38:4:j_id41:10:j_id46'} } );return false;">Corre&ccedil;&atilde;o Monet&aacute;ria</a>
				    </li>
			    	<li id="li_tabelas_juros"><a class="menuImageJuros" href="#" id="formulario:j_id38:4:j_id41:11:j_id46" name="formulario:j_id38:4:j_id41:11:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:11:j_id46','parameters':{'formulario:j_id38:4:j_id41:11:j_id46':'formulario:j_id38:4:j_id41:11:j_id46'} } );return false;">Juros de Mora</a>
				    </li>
			    	<li id="li_tabelas_sincronizar"><a class="menuImageSinc" href="#" id="formulario:j_id38:4:j_id41:13:j_id46" name="formulario:j_id38:4:j_id41:13:j_id46" onclick=";A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id38:4:j_id41:13:j_id46','parameters':{'formulario:j_id38:4:j_id41:13:j_id46':'formulario:j_id38:4:j_id41:13:j_id46'} } );return false;">Atualiza&ccedil;&atilde;o de Tabelas e &Iacute;ndices</a>
				    </li>
				</ul>
		    </li>	
	</ul></span>
 
</html></span>
							
						</td>

						<td class="fundoMenuLateral" style="margin-left: 0;"></td>

					<td valign="top" id="conteudoPrincipal" width="98%"><span role="presentation" aria-live="none" aria-label=" " id="formulario:panelIncludes" summary=" ">
						
						<div id="contentPrincipal"><span role="presentation" aria-live="none" aria-label=" " id="formulario:j_id61" summary=" ">
									<div id="barraTitulo">
									</div><span id="formulario:painelMensagens"><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt" lang="pt">

	<script type="text/javascript">
		jQuery(function() {
			
			jQuery('#divMensagem').animate({ height: 'toggle', opacity: 'show'}, 'slow', function(){
				posicionaSeta();
			});
		});	   	
	</script>
	
</html></span></span>
		
			<div class="conteudoPrincipal">
			
				<div class="painelPrincipalBotoes">
					<div class="principalAbrirProjetos">	
						<div id="botoesInicio">
						
								<div class="sprite-criar"><a href="#" title="Criar Novo C&aacute;lculo" onclick="if(typeof jsfcljs == 'function'){jsfcljs(document.getElementById('formulario'),{'formulario:j_id83':'formulario:j_id83'},'');}return false"></a>	                     
								</div>
								
								<div class="sprite-abrir"><a href="#" title="Buscar C&aacute;lculo" onclick="if(typeof jsfcljs == 'function'){jsfcljs(document.getElementById('formulario'),{'formulario:j_id85':'formulario:j_id85'},'');}return false"></a>	                     
								</div>
													
								<div class="sprite-importar"><a href="#" title="Importar C&aacute;lculo" onclick="if(typeof jsfcljs == 'function'){jsfcljs(document.getElementById('formulario'),{'formulario:j_id87':'formulario:j_id87'},'');}return false"></a>	                     
								</div>
						</div>
						<div class="calculosRecentes"><label>
Abrir C&aacute;lculos Recentes</label><br />
									<!-- <s:convertEntity /> --><select name="formulario:j_id92" class="listaCalculosRecentes" size="10" ondblclick="AguardeShow();A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id95','containerId':'formulario:j_id89','oncomplete':function(request,event,data){AguardeHide()},'parameters':{'formulario:j_id95':'formulario:j_id95'} } )" onkeypress="if(event.which != 13)return false; AguardeShow();A4J.AJAX.Submit('formulario',event,{'similarityGroupingId':'formulario:j_id96','containerId':'formulario:j_id89','oncomplete':function(request,event,data){AguardeHide()},'parameters':{'formulario:j_id96':'formulario:j_id96'} } )"></select>							
						</div>	
					</div><div id="formulario:modalSobre" style="display: none;"><input autocomplete="off" id="formulario:modalSobreOpenedState" name="formulario:modalSobreOpenedState" type="hidden" /><div class="rich-modalpanel " id="formulario:modalSobreContainer" style="position: absolute; display: none; z-index: 2000; background-color: inherit;"><div class="rich-mpnl-mask-div-opaque rich-mpnl-mask-div" id="formulario:modalSobreDiv" style="z-index: -1;"><!-- button class="rich-mpnl-button" id="formulario:modalSobreFirstHref"></button --></div><div class="rich-mpnl-panel" id="formulario:modalSobreFirstHref" role="dialog" tabindex="0"><div class="rich-mp-container" id="formulario:modalSobreCDiv" style="position: absolute; left: 0px; top: 0px; z-index: 9;"><div class="rich-mpnl-shadow" id="formulario:modalSobreShadowDiv"></div><div aria-labelledby="formulario:modalSobreHeader" class=" rich-mpnl-content" id="formulario:modalSobreContentDiv" role="region"><div class="rich-mpnl-text rich-mpnl-controls " role="toolbar"><img src="../images/close_modal.png" alt="Fechar" onclick="Richfaces.hideModalPanel('modalSobre')" style="cursor:pointer" /></div><table border="0" cellpadding="0" cellspacing="0" class="rich-mp-content-table" id="formulario:modalSobreContentTable" style="width: 564px;height: 1px;"><tr style="height: 1%;"><td class="rich-mpnl-header-cell"><div class="rich-mpnl-text rich-mpnl-header " id="formulario:modalSobreHeader" style="white-space: nowrap;">
                				<span style="color: #ffffff; font-size:14px;"></span></div></td></tr><tr style="height: 99%"><td class="rich-mpnl-body" valign="top">
        			
        			<div id="modalBox">
        				
						<div class="modalboxDiv">Sistema de C&aacute;lculo Trabalhista</div>
        				<div class="modalboxDiv3">Desenvolvido pela Secretaria de Tecnologia da Informa&ccedil;&atilde;o do Tribunal Regional do Trabalho da 8&ordf; Regi&atilde;o.</div>
        				<div class="modalboxDivSiteDoProjeto">Site do Projeto</div>
        				<div>
 							<a href="https://sites.google.com/a/trt8.jus.br/pjecalc" class="modalboxDivSite" title="https://sites.google.com/a/trt8.jus.br/pjecalc" target="_blank">
								https://sites.google.com/a/trt8.jus.br/pjecalc
							</a>       				
        				</div>
        				
						<div class="modalboxDivVersao">Vers&atilde;o 2.15.1</div>
        					
        			</div></td></tr></table></div></div></div><div class="rich-mpnl-mask-div rich-mpnl-mask-div-transparent" id="formulario:modalSobreCursorDiv" style="z-index: -200;"><!-- button class="rich-mpnl-button" id="formulario:modalSobreLastHref"></button --></div><div id="formulario:modalSobreLastHref" tabindex="0"></div><script type="text/javascript">new ModalPanel('formulario:modalSobre',
				{
					width: 564,
					height: -1,

					minWidth: -1,
					minHeight: -1,

					resizeable: false,
					moveable: true,

					left: "auto",
					top: "auto",

					zindex: 2000,onresize: '',onmove: '',onshow: '',onhide: '',onbeforeshow: '',onbeforehide: '',
					domElementAttachment: "",				
					keepVisualState: false,
					showWhenRendered: false,
					selectBehavior: "disable",

					autosized: true,
					overlapEmbedObjects: false});</script></div><script type="text/javascript"></script></div>
	   				
					<div class="barraIcones">
						<ul>
							<li>
								<a class="principalImageManual" href="http://pje.csjt.jus.br/manual/index.php/PJE-Calc" title="Manual" target="_blank">
									Manual
								</a>
							</li>
							<li>
								<a class="principalImageTutorial" href="http://pje.csjt.jus.br/manual/index.php/PJe-Calc-Tutorial" title="Tutorial" target="_blank">
									Tutorial
								</a>
							</li>
							<li><a href="#" title="Sobre" onclick="var a=function(){Richfaces.showModalPanel('modalSobre'); return false;};var b=function(){if(typeof jsfcljs == 'function'){jsfcljs(document.getElementById('formulario'),{'formulario:j_id104':'formulario:j_id104'},'');}return false};return (a()==false) ? false : b();" class="principalImageInfo">Sobre</a>
							</li>
						</ul>
						
					</div>
				</div>
			</div> 
							
							<script>
								AguardeHide();
							</script>
						</div></span>
					</td>
				</tr>
			</table>
				</div><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt" lang="pt"><div id="formulario:msgAguarde" style="display: none;"><input autocomplete="off" id="formulario:msgAguardeOpenedState" name="formulario:msgAguardeOpenedState" type="hidden" /><div class="rich-modalpanel msgAguarde" id="formulario:msgAguardeContainer" style="position: absolute; display: none; z-index: 2000; background-color: inherit;"><div class="rich-mpnl-mask-div-opaque rich-mpnl-mask-div" id="formulario:msgAguardeDiv" style="z-index: -1;"><!-- button class="rich-mpnl-button" id="formulario:msgAguardeFirstHref"></button --></div><div class="rich-mpnl-panel" id="formulario:msgAguardeFirstHref" role="dialog" tabindex="0"><div class="rich-mp-container" id="formulario:msgAguardeCDiv" style="position: absolute; left: 0px; top: 0px; z-index: 9;"><div class="rich-mpnl-shadow" id="formulario:msgAguardeShadowDiv"></div><div aria-labelledby="formulario:msgAguardeHeader" class=" rich-mpnl-content" id="formulario:msgAguardeContentDiv" role="region"><table border="0" cellpadding="0" cellspacing="0" class="rich-mp-content-table" id="formulario:msgAguardeContentTable" style="width: 1px;height: 1px;"><tr style="height: 99%"><td class="rich-mpnl-body" valign="top">
			<table width="300px" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr class="aguarde">
					<td align="center">
						<b>Processando...</b><br />
						<br /><img src="/pjecalc/images/loading.gif" alt="Carregando..." style="border: none;" /><br />
						<br />
					</td>
				</tr>
			</table><span id="formulario:key" style="display:none"><script type="text/javascript">new Richfaces.hotKey('formulario:key','esc','', {timing:'immediate'}, function(event) { stopRequest(); AguardeHide(); });</script></span></td></tr></table></div></div></div><div class="rich-mpnl-mask-div rich-mpnl-mask-div-transparent" id="formulario:msgAguardeCursorDiv" style="z-index: -200;"><!-- button class="rich-mpnl-button" id="formulario:msgAguardeLastHref"></button --></div><div id="formulario:msgAguardeLastHref" tabindex="0"></div><script type="text/javascript">new ModalPanel('formulario:msgAguarde',
				{
					width: -1,
					height: -1,

					minWidth: -1,
					minHeight: -1,

					resizeable: false,
					moveable: false,

					left: "auto",
					top: "auto",

					zindex: 2000,onresize: '',onmove: '',onshow: '',onhide: '',onbeforeshow: '',onbeforehide: '',
					domElementAttachment: "",				
					keepVisualState: false,
					showWhenRendered: false,
					selectBehavior: "disable",

					autosized: true,
					overlapEmbedObjects: false});</script></div><script type="text/javascript"></script></div>
</html>
				
			</div><input type="hidden" name="javax.faces.ViewState" id="javax.faces.ViewState" value="j_id3" autocomplete="off" />
</form><div id="skinPanel" style="display: none;"><input autocomplete="off" id="skinPanelOpenedState" name="skinPanelOpenedState" type="hidden" /><div class="rich-modalpanel " id="skinPanelContainer" style="position: absolute; display: none; z-index: 100; background-color: inherit;"><div class="rich-mpnl-mask-div-opaque rich-mpnl-mask-div" id="skinPanelDiv" style="z-index: -1;"><!-- button class="rich-mpnl-button" id="skinPanelFirstHref"></button --></div><div class="rich-mpnl-panel" id="skinPanelFirstHref" role="dialog" tabindex="0"><div class="rich-mp-container" id="skinPanelCDiv" style="position: absolute; left: 0px; top: 0px; z-index: 9;"><div class="rich-mpnl-shadow" id="skinPanelShadowDiv"></div><div aria-labelledby="skinPanelHeader" class="rich-mpnl-ovf-hd rich-mpnl-trim rich-mpnl-content" id="skinPanelContentDiv" role="region"><div class="rich-mpnl-text rich-mpnl-controls " role="toolbar"><img src="/pjecalc/images/closeMP.gif" onclick="Richfaces.hideModalPanel('skinPanel')" /></div><table border="0" cellpadding="0" cellspacing="0" class="rich-mp-content-table" id="skinPanelContentTable" style="height: 100%; width: 100%;"><tr style="height: 1%;"><td class="rich-mpnl-header-cell"><div class="rich-mpnl-text rich-mpnl-header " id="skinPanelHeader" style="white-space: nowrap;">Esquema de cores da aplica&ccedil;&atilde;o</div></td></tr><tr style="height: 99%"><td class="rich-mpnl-body" valign="top"><div id="j_id124">

    <div class="propertyView" id="propertyViewDiv" style="float: left;  width: 250px !important; min-width: 250px !important; "><div id="j_id124:Div" class="name"><label for="j_id124:j_id133:j_id134" class="">
<span class="label">Escolha o esquema:</span></label></div>
        <span class="value "><div id="j_id124:div"><form id="j_id124:j_id133" name="j_id124:j_id133" method="post" action="/pjecalc/pages/principal.jsf"><select name="j_id124:j_id133:j_id134" size="1" onchange="A4J.AJAX.Submit('j_id124:j_id133',event,{'similarityGroupingId':'j_id124:j_id133:j_id135','oncomplete':function(request,event,data){location.reload()},'parameters':{'j_id124:j_id133:j_id135':'j_id124:j_id133:j_id135'} } )" style="width: 250px">	<option value="skin/verde">verde</option>
	<option value="skin/azul" selected="selected">azul</option>
	<option value="skin/cinza">cinza</option>
	<option value="skin/altoContraste">altoContraste</option>
	<option value="skin/vermelho">vermelho</option>
</select><input type="hidden" autocomplete="off" name="j_id124:j_id133" value="j_id124:j_id133" /><input type="hidden" autocomplete="off" name="autoScroll" value="" /><input type="hidden" autocomplete="off" name="j_id124:j_id133:_link_hidden_" value="" /><input type="hidden" autocomplete="off" name="j_id124:j_id133:j_idcl" value="" /><script type="text/javascript">function clear_j_id124_3Aj_id133() {
_clearJSFFormParameters('j_id124:j_id133','',['j_id124:j_id133:_link_hidden_','j_id124:j_id133:j_idcl']);
}
function clearFormHiddenParams_j_id124_3Aj_id133(){clear_j_id124_3Aj_id133();}
function clearFormHiddenParams_j_id124_j_id133(){clear_j_id124_3Aj_id133();}
clear_j_id124_3Aj_id133();</script><input type="hidden" name="javax.faces.ViewState" id="javax.faces.ViewState" value="j_id3" autocomplete="off" /></form></div>
        </span>
        
    </div></div></td></tr></table></div><div class="rich-mpnl-resizer" id="skinPanelResizerN" style="width: 40px; height: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerE" style="height: 40px; width: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerS" style="width: 40px; height: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerW" style="height: 40px; width: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerNWU" style="width: 40px; height: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerNEU" style="height: 40px; width: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerNEL" style="width: 40px; height: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerSEU" style="height: 40px; width: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerSEL" style="width: 40px; height: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerSWL" style="height: 40px; width: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerSWU" style="width: 40px; height: 4px;"></div><div class="rich-mpnl-resizer" id="skinPanelResizerNWL" style="height: 40px; width: 4px;"></div></div></div><div class="rich-mpnl-mask-div rich-mpnl-mask-div-transparent" id="skinPanelCursorDiv" style="z-index: -200;"><!-- button class="rich-mpnl-button" id="skinPanelLastHref"></button --></div><div id="skinPanelLastHref" tabindex="0"></div><script type="text/javascript">new ModalPanel('skinPanel',
				{
					width: -1,
					height: 100,

					minWidth: -1,
					minHeight: -1,

					resizeable: true,
					moveable: true,

					left: "auto",
					top: "auto",

					zindex: 100,onresize: '',onmove: '',onshow: '',onhide: '',onbeforeshow: '',onbeforehide: '',
					domElementAttachment: "",				
					keepVisualState: false,
					showWhenRendered: false,
					selectBehavior: "disable",

					autosized: false,
					overlapEmbedObjects: false});</script></div><script type="text/javascript"></script></div>
	
	</body>
	<script src="/pjecalc/js/mascara/jquery.maskfinancial-1.3.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
	<script src="/pjecalc/js/mascara/jquery.maskMoney.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
	<script src="/pjecalc/js/mascara/jquery.maskedinput.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
	<script src="/pjecalc/js/mascara/jquery.alphanumeric.pack.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
	<script src="/pjecalc/js/mascara/jquery.alphanumeric.custom.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
	<script src="/pjecalc/js/geral.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
	<script src="/pjecalc/js/jquery.alerts.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
	<script src="/pjecalc/js/jquery.enableCellNavigation.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
	<script src="/pjecalc/js/menuAcessibilidade.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
	<script src="/pjecalc/js/assinador.js?2.15.1" type="text/javascript"></script>
	<script src="/pjecalc/js/utils.js?2.15.1" type="text/javascript" charset="iso-8859-1"></script>
</html>