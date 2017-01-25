FROM microsoft/dotnet:1.1.0-sdk-msbuild-rc3
COPY src /app
WORKDIR /app
RUN ["dotnet", "restore"]
WORKDIR /app/Vrtl.Ping.Host
RUN ["dotnet", "build"]
EXPOSE 5000/tcp
ENV ASPNETCORE_URLS https://*:5000
ENTRYPOINT ["dotnet", "run", "--server.urls", "http://*:5000"]