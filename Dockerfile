# Etapa de Build (Usa o SDK completo do .NET 9 para compilar)
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copia os arquivos do projeto e restaura as dependências
COPY *.csproj ./
RUN dotnet restore

# Copia o resto do código e compila a versão final
COPY . ./
RUN dotnet publish -c Release -o out

# Etapa de Execução (Usa apenas o Runtime do .NET 9, deixando a imagem super leve)
FROM mcr.microsoft.com/dotnet/runtime:9.0
WORKDIR /app
COPY --from=build /app/out .

# Comando para rodar a aplicação
ENTRYPOINT ["dotnet", "SeuProjetoConsole.dll"]