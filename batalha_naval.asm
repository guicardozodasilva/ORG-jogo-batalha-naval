 	.data
matriz: 			.space 400					#tamanho total da matriz (10x10x4=400)
#navios:			.asciz	"3\n1 5 1 1\n0 5 2 2\n0 1 6 4" 		#string para inserção dos navios
#navios:			.asciz	"2\n0 1 0 0"
navios:				.asciz	"11\n1 5 1 1\n0 5 2 2\n0 1 6 4\n0 1 9 9\n0 1 9 8\n0 1 9 7\n0 1 9 6\n0 1 9 5\n0 1 9 4\n0 1 9 3\n0 1 0 0"  		#string para inserção dos navios
numeros:			.asciz	"0123456789"
msg_quebra_linha:		.asciz "\n"
msg_limpar_tela:		.asciz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
msg_espaco:			.asciz " "
msg_erro_ja_possui_navio: 	.asciz "Erro! Em uma posição que já possuía navio, você tentou inserir o navio "
msg_linha_e_coluna:		.asciz "Linha e coluna respectiva do conflito: "
msg_erro_navio_grande: 		.asciz "Erro! Navio é grande demais para o jogo na respectiva posição inicial dele. O navio mencionado é o "
msg_menu:			.asciz	"\n\nDigite a opcao que deseja:\n1-Nova jogada\n2-Mostrar estado atual da matriz\n3-Mostrar matriz com as posições dos navios\n4-Reiniciar jogo\n5-Sair do jogo\n\n"
msg_inserir_linha:		.asciz	"\n\nInsira a linha (valor entre 0 e 9)\n"
msg_inserir_coluna:		.asciz	"\nInsira a coluna (valor entre 0 e 9)\n"
msg_fim_jogo:			.asciz	"\n\nVoce optou por sair do jogo :(\n"
msg_exibir_matriz_atual:	.asciz	"\n\nAbaixo está a matriz atual\n\n"
msg_jogo_reiniciado:		.asciz	"\n\nJogo reiniciado!\n\n"
msg_main:			.asciz	"\n\nEntrou no main!\n"
acertou_navio_caracter:		.asciz	"X"
errou_navio_caracter:		.asciz	"-"
nao_exibe_pos_matriz_caracter:	.asciz	"?"
msg_coluna_linha_invalida:	.asciz	"\n\nLinha ou coluna menor que 0 ou maior que 9\nDIGITE NOVAMENTE COM VALORES ENTRE 0 - 9"
msg_acertou:			.asciz "\nVoce acertou erxatamento isso de navios: "
recorde_tiros:			.word 	0
pont_atual_tiros:		.word	0
recorde_acertos:		.word 	0
pont_atual_acertos:		.word	0
recorde_afundados:		.word 	0
pont_atual_afundados:		.word	0
qnt_navios:			.word	0
posso_exibir_pos_navios:	.word	1
msg_recorde:			.asciz	"\n\nRecorde\n"
msg_recorde_tiros:		.asciz	"Tiros: "
msg_recorde_acertos:		.asciz	"\nAcertos: "
msg_recorde_afundados:		.asciz	"\nAfundados: "
msg_pont_atual:			.asciz	"\n\nSua pontuacao\n"
msg_pont_atual_tiros:		.asciz	"Tiros: "
msg_pont_atual_acertos:		.asciz	"\nAcertos: "
msg_pont_atual_afundados:	.asciz	"\nAfundados: "

	.text
main: 
	la	s0, matriz			# endereço inicial da matriz carregada em s0
	la	s1, navios			# endereço inicial da string navios carregada em s1
	la	s2, numeros			# endereço inicial da string numeros carregada em s2
	lw	t0, (s0)			# carrega o primeiro valor da matriz s0 em t0 
	lb	t1, (s1)			# carrega a primeira letra da string navios s1 em t1
	lb	t2, (s2)			# carrega o primeiro número da string navios s2 em t2 
	addi	a1, a1, 100			# tamanho total da matriz
	addi	a2, zero, 0			# auxiliar para o for 
	addi	a3, zero, 0			# auxiliar para o for 
	addi	a4, zero, 10			# auxiliar para imprimir a matriz e quebrar linha
	addi	a5, zero, 0			# auxilar para saber qual número da string navios
	addi	a6, zero, 8			# valor de cada navio na string navios
	addi	a7, zero, 2			# valor para saber se o navios será inserido na vertical ou horizontal
	addi	s4, zero, 4			# valor para saber o tamanho do  navio que será inserido
	addi	s5, zero, 0			# registrador responsável por armazenar o tamanho do navio que será inserido
	addi	s6, zero, 6			# valor para saber a linha que o navio será inserido
	addi	s7, zero, 0			# registrador responsável por armazenar a linha que o navio que será inserido
	addi	s8, zero, 8			# valor para saber a coluna que o navio será inserido
	addi	s9, zero, 0			# registrador responsável por armazenar a coluna que o navio que será inserido
	addi	s10, zero, 0			# registrador para o loop 
	addi	t3, zero, 1			# valores das embarcacoes
	addi	t4, zero, 0
	j	zera_matriz			# preenche toda matriz com zero.

#############################################################
#
# zera_matriz						
# função responsável por inserir o número zero(0) na matriz  
#	
#############################################################
zera_matriz:
	beq 	a2, a1, qnt_embarcacoes		# se a2 (0) = a1 (100), acaba o laço de repetição. 
	sw	zero, (s0)			# preenche com o valor zero a matriz
	addi	s0, s0, 4			# vai para a próxima posição da matriz
	addi	a2, a2, 1			# incremento de um no registrador a2	
	j	zera_matriz			# continua o laço de repetição
	
#############################################################
#
# qnt_embarcacoes							
# função responsável por contabilizar a quantidade de  
# embarcações quer serão inseridas na matriz
#		
#############################################################		
qnt_embarcacoes:
	addi	a2, zero, 0			# zera a2, pois usaremos no for usado na função percorre_string_navios
	lb	t1, (s1)			# atualiza da string navios s1 em t1
	beq	t1, a4, calc_qnt_embarcacoes	# se t1(valor atual da string navios) for = a4 (10 é \n na tabela ascii), significa que já lemos a qnt_navios
	beq	s7, zero, primeiro_caracter 	# s7 = 0, então está no primeiro caracter da string navios
	
	addi	s7, s7, 1			# incrementa s7 
	beq	t1, t2, reinicia_t2
	addi	s2, s2, 1			# vai para o próximo número da string números
	lb	t2, (s2)			# carrega número da string navios s2 em t2
	addi	s9, s9, 1 			# registrador responsável por armazenar o valor da quantidade de navios que serão inseridos.
	j	qnt_embarcacoes

#############################################################
#
# primeiro_caracter							
# função que captura o valor da quantidade de embarcações
# do primeiro caracter da string navios
#		
#############################################################	
primeiro_caracter:
	lb	t2, (s2)			# carrega o primeiro número da string números s2 em t2 
	beq	t1, t2, reinicia_t2
	addi	s2, s2, 1			# vai para o próximo número da string números
	lb	t2, (s2)			# carrega número da string navios s2 em t2
	addi	a5, a5, 1 			# registrador responsável por armazenar o valor da quantidade de navios que serão inseridos.
	j	primeiro_caracter

#############################################################
#
# reinicia_t2							
# reinicia o registrador t2, o qual armazena a string
# numeros (0123456789)
#		
#############################################################		
reinicia_t2:
	la	s2, numeros			# endereço inicial da string numeros carregada em s2
	lb	t2, (s2)			# carrega o primeiro número da string navios s2 em t2
	addi	s1, s1, 1			# vai para o proximo valor da string navios
	addi	s7, s7, 1			# incrementa s7 para saber que vai para o segundo caracter da string navios
	j	qnt_embarcacoes

#############################################################
#
# calc_qnt_embarcacoes							
# função que realiza a soma da quantidade de embarcações
# com base na string navios
#		
#############################################################	
calc_qnt_embarcacoes:
	addi	s1, s1, -1					# retorna para o valor anterior da string navios
	bgt	s7, t3, calc_qnt_embarcacoes_superior_a_9	# s7 (aux p/ saber se tem mais de 1 caracter) > t3 (1), significa que teve 2 caracteres para a qnt de navios
	addi	s11, zero, 0					# zero o s11, pois uso ele na funcao calc_posicao_navio
	addi	s9, zero, 0					# zero o s9, pois uso ele na funcao calc_posicao_navio
	addi	s7, zero, 0					# zero o s9, pois uso ele na funcao calc_posicao_navio
	j	percorre_string_navios	

#############################################################
#
# calcula_qnt_navios_superior_a_9							
# função que realiza a soma da quantidade de embarcações
# se a quantidade de navios for superior a 9
#		
#############################################################	
calc_qnt_embarcacoes_superior_a_9:
	mul	s11, a5, a4			# S11 (qnt_navios) = S7 (primeiro caracter string navios) * A4 (10)	 
	add	s11, s11, s9			# S11 (qnt_navios) = S11 + S9 (segundo caracter string navios)
	add	a5, zero, s11			# salva em a5 a qnt_navios
	addi	s11, zero, 0			# zero o s11, pois uso ele na funcao calc_posicao_navio
	addi	s9, zero, 0			# zero o s9, pois uso ele na funcao calc_posicao_navio
	addi	s7, zero, 0			# zero o s9, pois uso ele na funcao calc_posicao_navio
	j	percorre_string_navios	

#############################################################
#
# percorre_string_navios							
# função que percorre a string navios e dependendo em qual
# posição está, pula para a função respectiva a posição
#		
#############################################################
percorre_string_navios:
	la	s2, numeros			# endereço inicial da string numeros carregada em s2	
	lb	t2, (s2)			# carrega o primeiro número da string números s2 em t2
	la	s11, qnt_navios			# carrega o valor da memória do .word qnt_navios
	addi	a5, a5, 1			# incrementar 1 na qnt_navios para o laço for da função verifica_se_navio_afundou
	sw	a5, (s11) 			# salva a qnt_navios que serão inseridos de a5 para o .word qnt_navios
	addi	a5, a5, -1			# decrementa em 1 o valor de a5
	beq	a2, a5, imprime_matriz 		# verifica se inseriu todos os navios a2(0) = a5 (qnt_navios)
	beq	a3, a7, orientacao_navio	# se a3 = a7 (2). Significa que estamos pegando o número da orientação do navio
	beq	a3, s4, tamanho_navio		# se a3 = s4 (4). Significa que estamos pegando o tamanho do navio que será inserido
	beq	a3, s6, linha_navio		# se a3 = s6 (6). Significa que estamos pegando a linha que o navio será inserido
	beq	a3, a6, coluna_navio		# se a3 (0) = a6 (8)
	addi	s1, s1, 2			# vai para o próximo número da string navios. Pula de 2 em 2 para pular os espações e \n 
	lb	t1, (s1)			# atualiza valor de t1
	addi	a3, a3, 2
	j	percorre_string_navios

#############################################################
#
# orientacao_navio							
# função responsável por saber se o navio que será inserido
# possui orientação vertical ou horizontal
#		
#############################################################	
orientacao_navio:
	beq	t1, t2, navio_horizontal	# se t1(valor 1 ou 0) = t2 (0)
	addi	s3, zero, 1			# s3 é responsável por armazenar a orientação do navio (vertical ou horizontal)
	addi	s1, s1, 2			# vai para o próximo número da string navios. Pula de 2 em 2 para pular os espações e \n 
	lb	t1, (s1)			# atualiza valor de t1
	addi	a3, a3, 2
	j	percorre_string_navios

#############################################################
#
# navio_horizontal							
# armazena a orientação horizontal do navio (0)
#		
#############################################################		
navio_horizontal:
	addi	s3, zero, 0			# s3 é responsável por armazenar a orientação do navio (vertical ou horizontal)	
	addi	s1, s1, 2			# vai para o próximo número da string navios. Pula de 2 em 2 para pular os espações e \n 
	lb	t1, (s1)			# atualiza valor de t1
	addi	a3, a3, 2
	j	percorre_string_navios

#############################################################
#
# tamanho_navio							
# função responsável por descobrir o tamanho do navio que
# será inserido
#		
#############################################################		
tamanho_navio:
	beq	t1, t2, atualiza_valores	# t1 é o valor do tamanho da string navios na string navios e compara com t2 
						# que é a string de 0 a 9 para capturar o valor do tamanho do navio
						
	addi	s2, s2, 1			# vai para o próximo número da string números
	lb	t2, (s2)			# carrega número da string navios s2 em t2
	addi	s5, s5, 1 			# registrador responsável por armazenar o tamanho do navio que será inserido
	j	tamanho_navio

#############################################################
#
# atualiza_registradores							
# função responsável por atualizar alguns registradores 
# e retorna para a função percorre_string_navios
#		
#############################################################	
atualiza_registradores:
	addi	a3, zero, 0			# atualiza o valor de a3 para zero
	addi	s10, zero, 0			# atualiza o aux do for que compara o tamanho do vetor
	addi	s5, zero, 0			# atualiza o valor de s5 (tamanho navio) para zero
	addi	s7, zero, 0 			# atualiza o valor de s7 (linha do navio) para zero
	addi	s9, zero, 0 			# atualiza o valor de s7 (coluna do navio) para zero
	addi	t3, t3, 1			# add 1 no registrador t3 (responsavel pelo numero do navio)
	la	s0, matriz			# endereço inicial da matriz carregada em s0
	
	jal	final_string_navios		# verifica se chegou no final da string navios
							
	j	percorre_string_navios
	
#############################################################	
#
# final_string_navios
# verifica se chegou no final da string navios
# isso serve para caso o número de navios informado seja maior
# do que realmente navios existentes para inserir.
# Exemplo: 3\n0 4 2 2\n0 1 6 4
#
#############################################################
final_string_navios:
	addi	s1, s1, 1			# vai para o próximo número da string navios para verficar
						# se chegou no /0 final da string navios
	lb	t1, (s1)			# atualiza valor de t1
	beq	t1, zero, imprime_matriz	# se chegou ao final da string, imprime a matriz
	addi	s1, s1, -1			# volta para a posição que estava para continuar lendo certo os núemros da string
	lb	t1, (s1)			# atualiza valor de t1
	ret
	
#############################################################	
#
# linha_navio
# função responsável por saber a 
# linha em que o navio será inserido
#
#############################################################	
linha_navio:
	beq	t1, t2, atualiza_valores	# t1 é o valor da linha do navio na string navios e compara com t2 
						# que é a string de 0 a 9 para capturar o valor do tamanho do navio
						
	addi	s2, s2, 1			# vai para o próximo número da string números
	lb	t2, (s2)			# carrega número da string navios s2 em t2
	addi	s7, s7, 1 			# registrador responsável por armazenar a linha que o navio que será inserido
	j	linha_navio

#############################################################	
#
# atualiza_valores
# atualiza alguns valores e retorna
# para a função percorre_string_navios
#
#############################################################		
atualiza_valores:
	addi	s1, s1, 2			# vai para o próximo número da string navios. Pula de 2 em 2 para pular os espaços e \n 
	lb	t1, (s1)			# atualiza valor de t1
	addi	a3, a3, 2			# incrementa o aux a3 em 2, que é usado na função percorre_string_navios
	j	percorre_string_navios

#############################################################	
#
# coluna_navio
# função responsável por saber a 
# coluna em que o navio será inserido
#
#############################################################		
coluna_navio:
	beq	t1, t2, calc_posicao_navio	# t1 é o valor da coluna do navio na string navios e compara com t2 
						# que é a string de 0 a 9 para capturar o valor do tamanho do navio
						
	addi	s2, s2, 1			# vai para o próximo número da string números
	lb	t2, (s2)			# carrega número da string navios s2 em t2
	addi	s9, s9, 1 			# registrador responsável por armazenar a coluna que o navio que será inserido
	j	coluna_navio

#############################################################	
#
# calc_posicao_navio
# função responsável por calcular a 
# posicao em que o navio será inserido
#
#############################################################			
calc_posicao_navio:	
	addi	a2, a2, 1			# incrementa de 2 em 2
	mul	s11, s7, a4			# S11 (POSICÃO INICIAL NAVIO) = S7 (LINHA) * A4 (10 QNT COLUNA)	 
	add	s11, s11, s9			# S11 (POSICÃO INICIAL NAVIO) = S11 + S9 (COLUNA)
	mul	s11, s11, s4			# S11 (POSICÃO INICIAL NAVIO) = s11 * s4 (4)
	la	s0, matriz			# endereço inicial da matriz carregada em s0
	add	s0, s0, s11			# adiciona a posição inicial do vetor com s11 (posição que o navio será inserido)
	
	add	t5, s7, s5			# t5 = linha (s7) + tamanho navio (s5) e salva em t5
	blt	a4, t5, erro_navio_grande	# a4 (10) < t5, significa que o navio é maior do que pode ser inserido
	
	add	t6, s9, s5 			# t6 = coluna (s9) + tamanho navio (s5) e salva em s9
	blt	a4, t6, erro_navio_grande	# a4 (10) < t6, significa que o navio é maior do que pode ser inserido
	
	j	insere_embarcacoes
	
#############################################################	
#
# erro_navio_grande
# quando o navio é maior do que a posição inicial
# que ele suporta, é informado que o navio é
# grande demais e finaliza o programa
# Exemplo: 0 4 8 8
#
#############################################################	
erro_navio_grande:
	la 	a0, msg_erro_navio_grande   	# imprime mensagem de erro que o navio é grande demais para a posição
	li 	a7,4
	ecall
	
	mv 	a0, t3  			# imprime o número do navio que deu conflito
	li 	a7, 1		
	ecall
	
	la 	a0, msg_quebra_linha  		# quebra linha
	li 	a7,4
	ecall
	
	ebreak

#############################################################	
#
# insere_embarcacoes
# função responsável por inserir 
# as embarcações na matriz
#
#############################################################	
insere_embarcacoes:
	beq  	s10, s5, atualiza_registradores		# se s10 (0) = s5 (tamanho navio)
	lw	t0, (s0)				# carrega o valor da matriz s0 em t0 na respectiva posição 
	bne	t0, zero, erro_posicao_ocupada		# t0 =! 0, é uma posição ocupada por outro navio
	beq  	s3, zero, insere_embarcacoes_horizontal	# se o valor lido da string navios for zero, insere a embarcação na horizontal
	sw	t3, (s0)				# salva o valor da embarcacão na posição vertical
	addi	s0, s0, 40				# incrementa o s0 em 1 e vai para a próxima posição vertical do navio
	addi	s10, s10, 1 				# incrementa o s10 em 1
	j	insere_embarcacoes

#############################################################	
#
# insere_embarcacoes_horizontal
# função responsável por inserir 
# as embarcações na horizontal
#
#############################################################	
insere_embarcacoes_horizontal:
	sw	t3, (s0)			# salva o valor da embarcacão na posição
	addi	s0, s0, 4			# incrementa o s0 em 1 e vai para a próxima posição horizontal do navio
	addi	s10, s10, 1 			# incrementa o s10 em 1
	j	insere_embarcacoes

#############################################################	
#
# erro_posicao_ocupada
# se o navio atual possuir a mesma posição que 
# um navio que já foi inserido, é informado que 
# já possui um navio na posição e finaliza o programa
#
#############################################################
erro_posicao_ocupada:
	la 	a0, msg_erro_ja_possui_navio   # imprime mensagem de erro que ja possui navio na posição
	li 	a7,4
	ecall
	
	mv 	a0, t3  			# imprime o número do navio que deu conflito
	li 	a7, 1		
	ecall
	
	la 	a0, msg_quebra_linha  		# quebra linha
	li 	a7,4
	ecall
	
	la 	a0, msg_quebra_linha  		# quebra linha
	li 	a7,4
	ecall
	
	la 	a0, msg_linha_e_coluna  	# mensagem da linha e coluna respectiva do conflito
	li 	a7,4
	ecall
	
	mv 	a0, s7  			# imprime a linha do conflito
	li 	a7, 1		
	ecall
	
	la 	a0, msg_espaco 			# imprime um espaço
	li 	a7,4
	ecall
	
	mv 	a0, s9  			# imprime a coluna do conflito
	li 	a7, 1		
	ecall
	
	ebreak

#############################################################	
#
# imprime_matriz
# função responsável por imprimir
# a matriz com os navios inseridos
# e com os tiros que serão realizados
#
#############################################################								
imprime_matriz:	
	beq 	t4, a1, exibe_menu			# se t4 (0) = a1 (100), acaba o laço de repetição. Inicialmente a2 = 0 e vai somando 1
	beq	a3, a4, quebra_linha_matriz 		# se a3 (0) = a4 (10), acaba o laço e vai para a função quebra_linha. Inicialmente o a3 = 0 e vai somando 1 
	
	lw 	s1, (s0)				# carrega o valor atual do vetorA s0 em s1 
	
	addi	a5, zero, 88				# adiciona o valor 88 em a5. Tal valor é respectivo ao caracter "X" na tabela ASCII
	addi	a6, zero, 45				# adiciona o valor 45 em a6. Tal valor é respectivo ao caracter "-" na tabela ASCII
	
	beq	s1, a5, imprime_string_acertou		# se o valor lido da matriz for igual a 88 (é o caracter "X" na tabela ASCII), imprime o caracter "X"
	beq	s1, a6, imprime_string_errou		# se o valor lido da matriz for igual a 45 (é o caracter "-" na tabela ASCII), imprime o caracter "-"
	
	la 	s5, posso_exibir_pos_navios		# carrega valor da memória da .word 
	lw	s5, (s5) 
	beq	s5, zero, nao_exibe_pos_navios		# se s5 = 0, não exibe posição dos navios 		
	mv 	a0, s1  				# imprime valor da matriz
	li 	a7, 1		
	ecall	
	
	j continuacao_imprime_matriz

#############################################################	
#
# nao_exibe_pos_navios
# imprime o caracter "?" na matriz, 
# se selecionado no menu a opção
# 2-Mostrar estado atual da matriz
#
#############################################################		
nao_exibe_pos_navios:	
	
	la 	a0, nao_exibe_pos_matriz_caracter	# imprime o caracter "?" na matriz 
	li 	a7, 4 				
	ecall 					
	
	j continuacao_imprime_matriz
	
#############################################################	
#
# quebra_linha_matriz
# função que faz a quebra de linha 
# após 10 valores da matriz
#
#############################################################					
quebra_linha_matriz:
	addi	a3, zero, 0			# zera o auxiliar a3 para continuar quebrando linha depois de 10 posiçoes
	
	la 	a0, msg_quebra_linha  		# imprime quebra linha
	li 	a7,4
	ecall
	
	j	imprime_matriz

#############################################################	
#
# imprime_string_acertou
# imprime o caracter "X" na matriz, 
# informando que acertou o navio
#
#############################################################		
imprime_string_acertou:
	la a0, acertou_navio_caracter 		# imprime o caracter "X" na matriz	
	li a7, 4 				
	ecall 					
	
	j continuacao_imprime_matriz

#############################################################	
#
# imprime_string_errou
# imprime o caracter "-" na matriz, 
# informando que acertou o navio
#
#############################################################
imprime_string_errou:
	la a0, errou_navio_caracter 		# imprime o caracter "-" na matriz	
	li a7, 4 				
	ecall 	
	
	j continuacao_imprime_matriz

#############################################################	
#
# continua_impressao
# função que continua a impressão da matriz
#
#############################################################	
continuacao_imprime_matriz:	
	la 	a0, msg_espaco  		# imprime mensagem
	li 	a7,4
	ecall
	
	addi 	t4, t4,1			# incrementa o auxiliar do laço
	addi 	a3, a3,1			# incrementa o auxiliar do laço
	addi 	s0, s0, 4			# vai para a próxima posição do vetor
	j 	imprime_matriz	

#############################################################	
#
# exibe_menu
# função responsável por exibir o menu
# e ir para a opção selecionada
#
#############################################################			
exibe_menu:
	la 	s6, pont_atual_acertos
	lw	t3, (s6)
	
	la 	a0, msg_menu 			# exibe menu
	li 	a7,4
	ecall
			
	addi 	a7, zero, 5  			# le opcao que foi digitada e armazena em a0
	ecall	
	
	addi	a5, zero , 1
	beq	a0, a5, nova_jogada
	
	addi	a5, zero , 2
	beq	a0, a5, exibe_matriz_atual
	
	addi	a5, zero , 3
	beq	a0, a5, exibe_posicao_navios
	
	addi	a5, zero , 4
	beq	a0, a5, reinicia_jogo
	
	addi	a5, zero , 5
	beq	a0, a5, finaliza_jogo
	
	ecall	

#############################################################	
#
# limpar_tela
# função responsável por limpar a tela no console
#
#############################################################	
limpar_tela:
	la	a0, msg_limpar_tela			
	li 	a7,4
	ecall
	ret

#############################################################	
#
# nova_jogada
# função responsável por realizar 
# uma nova jogada do usuário
#
#############################################################		
nova_jogada:
	jal	limpar_tela
	
	addi	a4, zero, 10
	
	la	s6, pont_atual_afundados
	sw	zero, (s6)			# a cada nova jogada, zera a pontuação atual de navios afundados
	
	la 	s6, pont_atual_acertos		# carrega valor da memória da pontuação atual de acertos em s6
	lw	t3, (s6)			# carrega o valor da pontuação atual de acertos em t3
	
	la	t5, pont_atual_tiros		# carrega valor da memória da pontuação atual de tiros em t5
	lw	t6, (t5)			# carrega o valor da pontuação atual de tiros em t6
	addi	t6, t6, 1			# incrementa o valor da pontuação atual de tiros
	sw	t6, (t5)			# armazena em t5 o valor da pontuação atual de tiros
	lw	t6, (t5)			# carrega o valor da pontuação atual de tiros em t6
	
	la 	s9, recorde_tiros		# carrega valor da memória do recorde de tiros em s9
	lw	s10, (s9)			# carrega o valor do recorde de tiros em s10
	
	la 	a0, msg_inserir_linha		# inserir linha msg
	li 	a7,4
	ecall
	
	addi 	a7, zero, 5  			# le opcao que foi digitada e armazena em a0
	ecall			
	
	add	a1, zero, a0			# salva valor da linha digitada em a1
	
	addi	a5, zero, 9
	bgt  	a1, a5, linha_coluna_invalida	# se a1(linha) > a5(9), linha invalida 
	blt  	a1, zero, linha_coluna_invalida	# se a1(linha) < zero, linha invalida
	
	la 	a0, msg_inserir_coluna		# inserir coluna msg
	li 	a7,4
	ecall
	
	addi 	a7, zero, 5  			# le opcao que foi digitada e armazena em a0
	ecall			
	
	add	a2, zero, a0			# salva valor da coluna digitada em a2
	bgt  	a2, a5, linha_coluna_invalida	# se a1(linha) > a5(9), linha invalida 
	blt  	a2, zero, linha_coluna_invalida	# se a1(linha) < zero, linha invalida
	
	la	a5, acertou_navio_caracter	# X para marcar que o acertou o tiro em um navio
	la	a6, errou_navio_caracter	# - para marcar que o errou tiro de um navio
	lb	a5, (a5)			# carrega o caracter "X" no registrador a5
	lb	a6, (a6)			# carrega o caracter "-" no registrador a6
	
	mul	s11, a1, a4			# S11 (POSICÃO INICIAL NAVIO) = A1 (LINHA) * A4 (10 QNT COLUNA)	 
	add	s11, s11, a2			# S11 (POSICÃO INICIAL NAVIO) = S11 + S9 (COLUNA)
	mul	s11, s11, s4			# S11 (POSICÃO INICIAL NAVIO) = s11 * s4 (4)
	
	la	s0, matriz			# endereço inicial da matriz carregada em s0
	add	s0, s0, s11			# adiciona a posição inicial do vetor com s11 (posição que o navio será inserido)
	lw	t0, (s0)			# carrega o valor da matriz s0 em t0 na respectiva posição 
	bgt  	t0, zero, acertou_navio		# se o valor da posicao da matriz for > 0, significa que possui um navio
	
	sw	a6, (s0)			# salva o valor -8 na posição, indicando que errou do navio

	bgt 	t6, s10, novo_recorde_tiros	# se a pontuação atual de tiros(t6) > recorde tiros(s10), então salva novo recorde de tiros	
	
	jal	atualizar_regs_para_ver_se_navio_afundou
	jal	verifica_se_navio_afundou
	
	j exibe_menu

#############################################################	
#
# novo_recorde_tiros
# função responsável armazenar 
# o novo recorde de tiros
#
#############################################################				
novo_recorde_tiros:
	sw	t6, (s9)			# salva o novo recorde de tiros
	jal	atualizar_regs_para_ver_se_navio_afundou
	jal	verifica_se_navio_afundou
	j	exibe_menu

#############################################################	
#
# linha_coluna_invalida
# imprime que a coluna ou linha são 
# maiores que 9 e reinicia a jogada
#
#############################################################	
linha_coluna_invalida:
	la 	a0, msg_coluna_linha_invalida	# msg coluna ou linha maior que 9
	li 	a7,4
	ecall	
		
	j exibe_menu	

#############################################################	
#
# acertou_navio
# função responsável por armazenar o valor 
# 88, que é o caracter "X" na tabela ASCII, 
# na posição do tiro bem sucedido
#
#############################################################					
acertou_navio:
	sw	a5, (s0)			# salva o valor 88 na posição, indicando que acertou do navio
	
	
	addi	t3, t3, 1
	sw	t3, (s6)
	lw	t3, (s6)
		
	la 	s2, recorde_acertos
	lw	t2, (s2)
	
	bgt 	t3, t2, novo_recorde_acertos
	bgt 	t6, s10, novo_recorde_tiros	# se a pontuação atual de tiros(t6) > recorde tiros(s10), então salva novo recorde de tiros	
	
	jal	atualizar_regs_para_ver_se_navio_afundou
	jal	verifica_se_navio_afundou
	
	j exibe_menu

#############################################################	
#
# novo_recorde_acertos
# função responsável armazenar 
# o novo recorde de acertos
#
#############################################################	
novo_recorde_acertos:
	sw	t3, (s2)			# salva novo recorde de acertos
	bgt 	t6, s10, novo_recorde_tiros	# se a pontuação atual de tiros(t6) > recorde tiros(s10), então salva novo recorde de tiros	
	jal	atualizar_regs_para_ver_se_navio_afundou
	jal	verifica_se_navio_afundou
	j	exibe_menu

#############################################################	
#
# exibe_matriz_atual
# exibe a matriz atual e as 
# pontuações recordes e atuais
#
#############################################################	
exibe_matriz_atual:
	jal	limpar_tela
	
	la 	s5, posso_exibir_pos_navios	# carrega valor da memória da .word posso_exibir_pos_navios
	sw	zero, (s5)			# salva o valor 0 no .word posso_exibir_pos_navios
		
	jal	atualiza_regs_para_imprimir_matriz
	
	j	imprime_pontuacoes

#############################################################	
#
# exibe_posicao_navios
# exibe a matriz com as  
# posições dos navios
#
#############################################################	
exibe_posicao_navios:
	jal	limpar_tela
	
	la 	s5, posso_exibir_pos_navios	# carrega valor da memória da .word posso_exibir_pos_navios
	addi	a3, zero, 1
	sw	a3, (s5)			# salva o valor 1 no .word posso_exibir_pos_navios
	
	jal	atualiza_regs_para_imprimir_matriz
	
	j	imprime_pontuacoes
	
#############################################################	
#
# atualiza_regs_para_imprimir_matriz
# como o próprio nome diz,
# atualiza os registradores
# que serão utilizados para 
# imprimir a matriz	
#
#############################################################	
atualiza_regs_para_imprimir_matriz:
	addi	t4, zero, 0			# zero contador do for do imprime_matriz
	addi	a3, zero, 0			# zero contador do for do imprime_matriz
	la	s0, matriz			# endereço inicial da matriz carregada em s0
	addi	a1, zero, 100			# tamanho total da matriz
	addi	a2, zero, 0			# auxiliar para o for 
	ret	
	
#############################################################	
#
# imprime_pontuacoes
# imprime as pontuações recordes e atuais
#
#############################################################	
imprime_pontuacoes:
	
	addi	t4, zero, 0
	addi	a1, zero, 100
	addi	a3, zero, 0
	addi	a4, zero, 10
	
	la 	a0, msg_recorde			
	li 	a7,4
	ecall

	la 	a0, msg_recorde_tiros			
	li 	a7,4
	ecall
	la 	s2, recorde_tiros		# carrega o endereço de memória do recorde de tiros em s2		
	lw	t2, (s2)			# carrega o valor do recorde de tiros em t2	
	mv 	a0, t2  			# imprime o recorde de tiros
	li 	a7, 1		
	ecall	
	
	la 	a0, msg_recorde_acertos			
	li 	a7,4
	ecall
	la 	s2, recorde_acertos		# carrega o endereço de memória do recorde de acertos em s2		
	lw	t2, (s2)			# carrega o valor do recorde de acertos em t2	
	mv 	a0, t2  			# imprime o recorde de acertos
	li 	a7, 1		
	ecall	
	
	la 	a0, msg_recorde_afundados		
	li 	a7,4
	ecall
	la 	s2, recorde_afundados		# carrega o endereço de memória do recorde de navios afundados em s2		
	lw	t2, (s2)			# carrega o valor do recorde de navios afundados em t2	
	mv 	a0, t2  			# imprime o recorde de navios afundados
	li 	a7, 1		
	ecall
		
	
	la 	a0, msg_pont_atual			# exibe menu
	li 	a7,4
	ecall

	la 	a0, msg_pont_atual_tiros	
	li 	a7,4
	ecall
	la	t5, pont_atual_tiros		# carrega o endereço de memória da pontuação atual de tiros em t5
	lw	t6, (t5)			# carrega o valor da pontuação atual de tiros em t5
	mv 	a0, t6  			# imprime a pontuação atual de tiros
	li 	a7, 1		
	ecall	
			
	la 	a0, msg_pont_atual_acertos	
	li 	a7,4
	ecall
	la	s6, pont_atual_acertos		# carrega o endereço de memória da pontuação atual de acertos em s6
	lw	t3, (s6)			# carrega o valor da pontuação atual de acertos em t3
	mv 	a0, t3  			# imprime a pontuação atual de acertos
	li 	a7, 1		
	ecall
	
	la 	a0, msg_pont_atual_afundados			
	li 	a7,4
	ecall
	la	s6, pont_atual_afundados	# carrega o endereço de memória da pontuação atual de navios afundados em s6
	lw	t3, (s6)			# carrega o valor da pontuação atual de navios afundados em t3
	mv 	a0, t3  			# imprime a pontuação atual de navios afundados
	li 	a7, 1		
	ecall
		

	la 	a0, msg_quebra_linha  		# imprime mensagem
	li 	a7,4
	ecall
	la 	a0, msg_quebra_linha  		# imprime mensagem
	li 	a7,4
	ecall
	
	la 	a0, msg_exibir_matriz_atual			
	li 	a7,4
	ecall

	j	imprime_matriz
	
#############################################################	
#
# verifica_se_navio_afundou
# função responsável por verificar se 
# algum navio afundou
#
#############################################################	
verifica_se_navio_afundou:
	beq	a3, a4, so_para_dar_ret 		# se a3 (1) = a4 (qnt_navios+1), acaba o laço e vai para a função quebra_linha. Inicialmente o a3 = 0 e vai somando 1 
	beq 	t4, a1, navio_totalmente_afundado	# se t4 (0) = a1 (100), acaba o laço de repetição. Inicialmente a2 = 0 e vai somando 1	
	lw 	s1, (s0)				# carrega o valor atual do vetorA s0 em s1 
	beq	a3, s1, existe_partes_do_navio_ainda	# se a3 = s1 (valor atual da matriz), significa que ainda existe partes do navio na matriz, ou seja, ele não foi totalmente afundado
	addi	t4, t4, 1
	addi	s0, s0, 4
	j	verifica_se_navio_afundou

#############################################################	
#
# navio_totalmente_afundado
# função responsável salvar a pont_atual_afundados
# e verificar se foi o recorde de navio afundados
#
#############################################################		
navio_totalmente_afundado:
	la	s6, pont_atual_afundados		# carrega o valor da memória do pont_atual_afundados no registrador s6
	lw	t3, (s6)				# carrega o valor atual de navios afundados no registrador t3
	addi	t3, t3, 1				# incrementa o valor atual de navio afundados em 1 no registrador t3
	sw	t3, (s6)				# salva o valor atual de navios afundados na memória do registrador s6 (pont_atual_afundados)
	lw	t3, (s6)				# carrega o valor atual de navios afundados no registrador t3
		
	la 	s2, recorde_afundados			# carrega o valor da memória do recorde_afundados no registrador s2
	lw	t2, (s2)				# carrega o valor de recordes de navios afundados no registrador t2
	
	bgt 	t3, t2, novo_recorde_afundados 		# se a pontuação atual de afundados(t3) > recorde afundados(t2), então salva novo recorde de afundados	
	
	j 	atualiza_regs_para_verificar_se_prox_navio_afundou

#############################################################	
#
# novo_recorde_afundados
# função responsável salvar
# o novo recorde de navios afundados
#
#############################################################	
novo_recorde_afundados:
	sw	t3, (s2)	# salva a pontuação atual de afundados no recorde de afundados
	j	atualiza_regs_para_verificar_se_prox_navio_afundou

#############################################################	
#
# existe_partes_do_navio_ainda
# função responsável por pular
# para a função que atualiza 
# os registradores para verificar
# se o próximo navio afundou
#
#############################################################	
existe_partes_do_navio_ainda:
	j	atualiza_regs_para_verificar_se_prox_navio_afundou

#############################################################	
#
# atualizar_regs_para_ver_se_navio_afundou
# função responsável por atualizar 
# registradores para verificar se 
# algum navio afundou
#
#############################################################	
atualizar_regs_para_ver_se_navio_afundou:
	
	la	s0, matriz				# carrega o endereço de memória da matriz em s0
	lw 	s1, (s0)				# carrega o valor atual do vetorA s0 em s1 
	addi	a3, zero, 1				# valor 1 no registrador aux a3 do laço for da função verifica_se_navio_afundou
	la	a4, qnt_navios				# carrega o endereço de memória da qnt_navios em a4
	lw	a4, (a4)				# carrega o valor da qnt_navios em a4
	addi	t4, zero, 0				# zera o registrador t4
	addi	a1, zero, 100				# salva o valor 100 no registrador a1

	ret

#############################################################	
#
# atualiza_regs_para_verificar_se_prox_navio_afundou
# função responsável por atualizar
# registradores para verificar se 
# o próximo navio afundou
#
#############################################################	
atualiza_regs_para_verificar_se_prox_navio_afundou:
	la	s0, matriz				# carrega o endereço de memória da matriz em s0
	lw 	s1, (s0)				# carrega o valor atual do vetorA s0 em s1 
	addi	t4, zero, 0				# zera o registrador t4
	addi	a3, a3, 1				# incrementa o aux a3 para o for
	j	verifica_se_navio_afundou

#############################################################	
#
# so_para_dar_ret
#
#############################################################				
so_para_dar_ret:
	ret
			
						
#############################################################	
#
# reinicia_jogo
# função responsável por reiniciar o jogo
#
#############################################################		
reinicia_jogo:
	jal	limpar_tela
	
	la 	a0, msg_jogo_reiniciado			
	li 	a7,4
	ecall
	
	j	reinicia_registradores

#############################################################	
#
# reinicia_registradores
# função responsável por zerar todos 
# os registrados para reiniciar o jogo
#
#############################################################	
reinicia_registradores:
	sw	zero, (s6)			# zera a pontuação atual dos acertos
	sw	zero, (t5)			# zera a pontuação atual dos tiros
	la	s6, pont_atual_afundados
	sw	zero, (s6)			# zera a pontuação atual de navios afundados
	addi	t0, zero, 0
	addi	t1, zero, 0
	addi	t2, zero, 0
	addi	s0, zero, 0
	addi	s1, zero, 0
	addi	a0, zero, 0
	addi	a1, zero, 0
	addi	a2, zero, 0
	addi	a3, zero, 0
	addi	a4, zero, 0
	addi	a5, zero, 0
	addi	a6, zero, 0
	addi	a7, zero, 0
	addi	s2, zero, 0
	addi	s3, zero, 0
	addi	s4, zero, 0
	addi	s5, zero, 0
	addi	s6, zero, 0
	addi	s7, zero, 0
	addi	s8, zero, 0
	addi	s9, zero, 0
	addi	s10, zero, 0
	addi	s11, zero, 0
	addi	t3, zero, 0
	addi	t4, zero, 0
	addi	t5, zero, 0
	addi	t6, zero, 0
			
	j	main

#############################################################	
#
# finaliza_jogo
# função responsável por finalizar o jogo
#
#############################################################		
finaliza_jogo:
	jal	limpar_tela
	
	la 	a0, msg_fim_jogo			# exibe menu
	li 	a7,4
	ecall
	
	ebreak
