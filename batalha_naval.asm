 	.data
matriz: 			.space 400					#tamanho total da matriz (10x10x4=400)
navios:				.asciz	"3\n1 5 1 1\n0 5 2 2\n0 1 6 4" 		#string para inserção dos navios
#navios:			.asciz	"2\n0 1 0 0"
numeros:			.asciz	"0123456789"
msg_quebra_linha:		.asciz "\n"
msg_espaco:			.asciz " "
msg_erro_ja_possui_navio: 	.asciz "Erro! Em uma posição que já possuía navio, você tentou inserir o navio "
msg_linha_e_coluna:		.asciz "Linha e coluna respectiva do conflito: "
msg_erro_navio_grande: 		.asciz "Erro! Navio é grande demais para o jogo na respectiva posição inicial dele. O navio mencionado é o "
msg_menu:			.asciz	"\n\nDigite a opcao que deseja:\n1-Nova jogada\n2-Mostrar estado atual da matriz\n3-Reiniciar jogo\n4-Sair do jogo\n\n"
msg_nova_jogada:		.asciz	"\n\nNova jogada\n"
msg_fim_jogo:			.asciz	"\n\nVoce optou por sair do jogo :(\n"
msg_exibir_matriz_atual:	.asciz	"\n\nAbaixo esta a matriz atual\n"
msg_jogo_reiniciado:		.asciz	"\n\nJogo reiniciado!\n"
msg_main:			.asciz	"\n\nEntrou no main!\n"

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
	addi	s9, zero, 0			# registrador responsável por armazenar a linha que o navio que será inserido
	addi	s10, zero, 0			# registrador para o loop 
	addi	t3, zero, 1			# valores das embarcacoes
	addi	t4, zero, 0
	jal	zera_matriz			# preenche toda matriz com zero.
			
	
zera_matriz:
	beq 	a2, a1, qnt_embarcacoes		# se a2 (0) = a1 (100), acaba o laço de repetição. 
	sw	zero, (s0)			# preenche com o valor zero a matriz
	addi	s0, s0, 4			# vai para a próxima posição da matriz
	addi	a2, a2, 1			# incremento de um no registrador a2	
	j	zera_matriz			# continua o laço de repetição
	
insere_embarcacoes:
	la	s2, numeros			# endereço inicial da string numeros carregada em s2	
	lb	t2, (s2)			# carrega o primeiro número da string números s2 em t2 
	beq	a2, a5, imprime_matriz 		# verifica se inseriu todos os navios a2(0) = a5 (qnt_navios)
	beq	a3, a6, coluna_navio		# se a3 (0) = a6 (8)
	beq	a3, a7, orientacao_navio	# se a3 = a7 (2). Significa que estamos pegando o número da orientação do navio
	beq	a3, s4, tamanho_navio		# se a3 = s4 (4). Significa que estamos pegando o tamanho do navio que será inserido
	beq	a3, s6, linha_navio		# se a3 = s6 (6). Significa que estamos pegando a linha que o navio será inserido
	addi	s1, s1, 2			# vai para o próximo número da string navios. Pula de 2 em 2 para pular os espações e \n 
	lb	t1, (s1)			# atualiza valor de t1
	addi	a3, a3, 2
	j	insere_embarcacoes
	
prox_navio:	
	addi	a2, a2, 1			# incrementa de 2 em 2
	mul	s11, s7, a4			# S11 (POSICÃO INICIAL NAVIO) = S7 (LINHA) * A4 (10 QNT COLUNA)	 
	add	s11, s11, s9			# S11 (POSICÃO INICIAL NAVIO) = S11 + S9 (COLUNA)
	mul	s11, s11, s4			# S11 (POSICÃO INICIAL NAVIO) = s11 * s4 (4)
	la	s0, matriz			# endereço inicial da matriz carregada em s0
	add	s0, s0, s11			# adiciona a posição inicial do vetor com s11 (posição que o navio será inserido)
	
	add	t5, s7, s5			# t5 = linha (s7) + tamanho navio (s5) e salva em s7
	blt	a4, t5, erro_navio_grande	# a4 (10) < t5, significa que o navio é maior do que pode ser inserido
	
	add	t6, s9, s5 			# t6 = coluna (s9) + tamanho navio (s5) e salva em s9
	blt	a4, t6, erro_navio_grande	# a4 (10) < t6, significa que o navio é maior do que pode ser inserido
	
	j	insere_navio
	
insere_navio:
	beq  	s10, s5, atualiza_registradores	# se s10 (0) = s5 (tamanho navio)
	lw	t0, (s0)			# carrega o valor da matriz s0 em t0 na respectiva posição 
	bne	t0, zero, erro_posicao_ocupada	# t0 =! 0, é uma posição ocupada por outro navio
	beq  	s3, zero, insere_horizontal
	sw	t3, (s0)			# salva o valor da embarcacão na posição vertical
	addi	s0, s0, 40			# incrementa o s0 em 1 e vai para a próxima posição vertical do navio
	addi	s10, s10, 1 			# incrementa o s10 em 1
	j	insere_navio

insere_horizontal:
	sw	t3, (s0)			# salva o valor da embarcacão na posição
	addi	s0, s0, 4			# incrementa o s0 em 1 e vai para a próxima posição horizontal do navio
	addi	s10, s10, 1 			# incrementa o s10 em 1
	j	insere_navio
	
atualiza_registradores:
	addi	a3, zero, 0			# atualiza o valor de a3 para zero
	addi	s10, zero, 0			# atualiza o aux do for que comapar o tamanho do vetor
	addi	s5, zero, 0			# atualiza o valor de s5 (tamanho navio) para zero
	addi	s7, zero, 0 			# atualiza o valor de s7 (linha do navio) para zero
	addi	s9, zero, 0 			# atualiza o valor de s7 (coluna do navio) para zero
	addi	t3, t3, 1			# add 1 no registrador t3 (responsavel pelo numero do navio)
	la	s0, matriz			# endereço inicial da matriz carregada em s0
	
	jal	final_string_navios		# verifica se chegou no final da string navios
							
	j	insere_embarcacoes

# verifica se chegou no final da string navios
# isso serve para caso o número de navios informado seja maior
# do que realmente navios existentes para inserir.
# Exemplo: 3\n0 4 2 2\n0 1 6 4
final_string_navios:
	addi	s1, s1, 1			# vai para o próximo número da string navios para verficar
						# se chegou no /0 final da string navios
	lb	t1, (s1)			# atualiza valor de t1
	beq	t1, zero, imprime_matriz	# se chegou ao final da string, imprime a matriz
	addi	s1, s1, -1			# volta para a posição que estava para continuar lendo certo os núemros da string
	lb	t1, (s1)			# atualiza valor de t1
	ret
		
orientacao_navio:
	beq	t1, t2, navio_horizontal	# se t1(valor 1 ou 0) = t2 (0)
	addi	s3, zero, 1			# s3 é responsável por armazenar a orientação do navio (vertical ou horizontal)
	addi	s1, s1, 2			# vai para o próximo número da string navios. Pula de 2 em 2 para pular os espações e \n 
	lb	t1, (s1)			# atualiza valor de t1
	addi	a3, a3, 2
	j	insere_embarcacoes
	
navio_horizontal:
	addi	s3, zero, 0			# s3 é responsável por armazenar a orientação do navio (vertical ou horizontal)	
	addi	s1, s1, 2			# vai para o próximo número da string navios. Pula de 2 em 2 para pular os espações e \n 
	lb	t1, (s1)			# atualiza valor de t1
	addi	a3, a3, 2
	j	insere_embarcacoes

tamanho_navio:
	beq	t1, t2, atualiza_valores	# t1 é o valor do tamanho da string navios na string navios e compara com t2 
						# que é a string de 0 a 9 para capturar o valor do tamanho do navio
	addi	s2, s2, 1			# vai para o próximo número da string números
	lb	t2, (s2)			# carrega número da string navios s2 em t2
	addi	s5, s5, 1 			# registrador responsável por armazenar o tamanho do navio que será inserido
	j	tamanho_navio
	
linha_navio:
	beq	t1, t2, atualiza_valores	# t1 é o valor da linha do navio na string navios e compara com t2 
						# que é a string de 0 a 9 para capturar o valor do tamanho do navio
	addi	s2, s2, 1			# vai para o próximo número da string números
	lb	t2, (s2)			# carrega número da string navios s2 em t2
	addi	s7, s7, 1 			# registrador responsável por armazenar a linha que o navio que será inserido
	j	linha_navio
	
coluna_navio:
	beq	t1, t2, prox_navio		# t1 é o valor da coluna do navio na string navios e compara com t2 
						# que é a string de 0 a 9 para capturar o valor do tamanho do navio
	addi	s2, s2, 1			# vai para o próximo número da string números
	lb	t2, (s2)			# carrega número da string navios s2 em t2
	addi	s9, s9, 1 			# registrador responsável por armazenar a coluna que o navio que será inserido
	j	coluna_navio
	
atualiza_valores:
	addi	s1, s1, 2			# vai para o próximo número da string navios. Pula de 2 em 2 para pular os espações e \n 
	lb	t1, (s1)			# atualiza valor de t1
	addi	a3, a3, 2
	j	insere_embarcacoes
	
qnt_embarcacoes:
	lb	t2, (s2)			# carrega o primeiro número da string navios s2 em t2 
	addi	a2, zero, 0			# auxiliar para o for 
	beq	t1, t2, insere_embarcacoes
	addi	s2, s2, 1			# vai para o próximo número da string números
	lb	t2, (s2)			# carrega número da string navios s2 em t2
	addi	a5, a5, 1 			# registrador responsável por armazenar o valor da quantidade de navios que serão inseridos.
	j	qnt_embarcacoes

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
	
	j	end

# quando o navio é maior do que a posição inicial dele suporta. 
# Exemplo: 0 4 8 8
erro_navio_grande:
	la 	a0, msg_erro_navio_grande   # imprime mensagem de erro que ja possui navio na posição
	li 	a7,4
	ecall
	
	mv 	a0, t3  			# imprime o número do navio que deu conflito
	li 	a7, 1		
	ecall
	
	la 	a0, msg_quebra_linha  		# quebra linha
	li 	a7,4
	ecall
	
	j	end
								
imprime_matriz:	
	beq 	t4, a1, end			# se t4 (0) = a1 (100), acaba o laço de repetição. Inicialmente a2 = 0 e vai somando 1
	beq	a3, a4, quebra_linha 		# se a3 (0) = a4 (10), acaba o laço e vai para a função quebra_linha. Inicialmente o a3 = 0 e vai somando 1 
	lw 	s1, (s0)			# carrega o valor atual do vetorA s0 em s1 
	mv 	a0, s1  			# imprime inteiro
	li 	a7, 1		
	ecall	
	
	la 	a0, msg_espaco  		# imprime mensagem
	li 	a7,4
	ecall
	
	addi 	t4, t4,1			# incrementa o auxiliar do laço
	addi 	a3, a3,1			# incrementa o auxiliar do laço
	addi 	s0, s0, 4			# vai para a próxima posição do vetor
	j 	imprime_matriz	
	
quebra_linha:
	addi	a3, zero, 0			# zera o auxiliar a3 para continuar quebrando linha depois de 10 posiçoes
	
	la 	a0, msg_quebra_linha  		# imprime mensagem
	li 	a7,4
	ecall
	
	j	imprime_matriz
	
end:
	j	exibe_menu
	ebreak	
		
exibe_menu:
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
	beq	a0, a5, reinicia_jogo
	
	addi	a5, zero , 4
	beq	a0, a5, finaliza_jogo
	
	ecall	

nova_jogada:
	la 	a0, msg_nova_jogada 			# exibe menu
	li 	a7,4
	ecall
	
	ebreak

		
exibe_matriz_atual:
	la 	a0, msg_exibir_matriz_atual			# exibe menu
	li 	a7,4
	ecall
	
	addi	t4, zero, 0			# zero contador do for do imprime_matriz
	addi	a3, zero, 0			# zero contador do for do imprime_matriz
	la	s0, matriz			# endereço inicial da matriz carregada em s0
	
	j	imprime_matriz
	j	exibe_menu

# erro na funcao qnt_embarcacoes no t2 que zera	
reinicia_jogo:
	la 	a0, msg_jogo_reiniciado			# exibe menu
	li 	a7,4
	ecall
	
	jal	main
	
finaliza_jogo:
	la 	a0, msg_fim_jogo			# exibe menu
	li 	a7,4
	ecall
	
	ebreak