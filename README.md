# Explorando Marte

![GitHub top language](https://img.shields.io/github/languages/top/Wendller/explore_mars_challenge)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Wendller/explore_mars_challenge/Elixir%20CI)
![](https://img.shields.io/badge/excoveralls-100%25-green)

## Descrição

Um conjunto de sondas foi enviado pela NASA à Marte e irá pousar num planalto. Esse
planalto, que curiosamente é retangular, deve ser explorado pelas sondas para que
suas câmeras embutidas consigam ter uma visão completa da área e enviar as
imagens de volta para a Terra.
A posição e direção de uma sonda são representadas por uma combinação de
coordenadas x-y e uma letra representando a direção cardinal para qual a sonda
aponta, seguindo a rosa dos ventos em inglês.

O planalto é dividido numa malha para simplificar a navegação. Um exemplo de
posição seria (0, 0, N), que indica que a sonda está no canto inferior esquerdo e
apontando para o Norte.
Para controlar as sondas, a NASA envia uma simples sequência de letras. As letras
possíveis são "L", "R" e "M". Destas, "L" e "R" fazem a sonda virar 90 graus para aesquerda ou direita, respectivamente, sem mover a sonda. "M" faz com que a sonda
mova-se para a frente um ponto da malha, mantendo a mesma direção.
Nesta malha o ponto ao norte de (x,y) é sempre (x, y+1).
Você deve fazer um programa que processe uma série de instruções enviadas para as
sondas que estão explorando este planalto. O formato da entrada e saída deste
programa segue abaixo.
A forma de entrada e saída dos dados fica à sua escolha.

### Entrada

A primeira linha da entrada de dados é a coordenada do ponto superior-direito da
malha do planalto. Lembrando que a inferior esquerda sempre será (0,0).
O resto da entrada será informação das sondas que foram implantadas. Cada sonda é
representada por duas linhas. A primeira indica sua posição inicial e a segunda uma
série de instruções indicando para a sonda como ela deverá explorar o planalto.
A posição é representada por dois inteiros e uma letra separados por espaços,
correspondendo à coordenada X-Y e à direção da sonda. Cada sonda será controlada
sequencialmente, o que quer dizer que a segunda sonda só irá se movimentar após
que a primeira tenha terminado suas instruções.

### Saída

A saída deverá contar uma linha para cada sonda, na mesma ordem de entrada,
indicando sua coordenada final e direção.

### Exemplo de entrada

- 5 5
- 1 2 N
- LMLMLMLMM

### Exemplo de saída

- 1 3 N

## Instalação

Para executar o programa, é necessário ter o Elixir instalado, para Linux e Mac você pode instalar via [adsf](https://asdf-vm.com/#/core-manage-asdf). A instalação padrão pode ser feita de acordo com o site [oficial](https://elixir-lang.org/install.html).

Ao final de tudo, você pode conferir a versão através do comando:

```bash
elixir -v
```

## Execução

Uma vez instalado o elixir, você pode clonar o projeto e se certificar de que baixou as dependências necessárias antes da função principal

A função principal recebe três parâmetros:

- Limites da área de busca: {x_limit, y_limit}
- Posição inicial da sonda: {x, y, direction}
- Lista de movimentos: [primeiro_movimento | movimentos_restantes]

```bash
# Clonando o repositório
git clone https://github.com/Wendller/explore_mars_challenge.git

# Mova para o repositório
cd explore_mars_challenge

# Instale as dependências
mix deps.get

# Inicie o iex
iex -S mix

# Execute a função principal
ExploreMars.init({5, 5}, {1, 2, "N"}, ["L", "M", "L", "M", "L", "M", "L", "M", "M"])
ExploreMars.init({5, 5}, {3, 3, "E"}, ["M", "M", "R", "M", "M", "R", "M", "R", "R", "M"])
```

## Testes

Execute os testes através do comando:

```bash
mix test --cover

| Percentage  | Module                     |
| ----------- | -------------------------- |
| 100.00%     | ExploreMars                |
| 100.00%     | Mission                    |
| 100.00%     | Probe                      |
| 100.00%     | ProbeControl               |
| ----------- | -------------------------- |
| 100.00%     | Total                      |
```
