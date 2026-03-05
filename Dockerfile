# Etapa de Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

COPY ["src/Restaurante.API/restaurante.csproj", "src/Restaurante.API/"]

RUN dotnet restore "src/Restaurante.API/restaurante.csproj"

COPY . .

WORKDIR "/app/src/Restaurante.API"

RUN dotnet publish "restaurante.csproj" -c Release -o /app/out

# Etapa de Execução
FROM mcr.microsoft.com/dotnet/runtime:9.0
WORKDIR /app
COPY --from=build /app/out .

ENTRYPOINT ["dotnet", "restaurante.dll"]