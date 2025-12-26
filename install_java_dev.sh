#SDKMan
curl -s "https://get.sdkman.io" | bash

export CONFIG_FILE=~/.sdkman/etc/config
mv  $CONFIG_FILE $CONFIG_FILE.old.1
cat $CONFIG_FILE.old.1 | grep -v -E "sdkman_auto_answer" > $CONFIG_FILE
echo "sdkman_auto_answer=true" >> $CONFIG_FILE

source ~/.bashrc

# Lista de JDKs que você usa
export JDKS=(
  "25.0.1-amzn"
  "21.0.9-amzn"
  "17.0.17-amzn"
  "11.0.29-amzn"
  "21.0.9-bisheng"
  "17.0.17-bisheng"
  "11.0.29-bisheng"
  "25.0.1-open"
  "21.0.2-open"
  "25.0.1-graal"
  "21.0.9-graal"
  "17.0.12-graal"
  "25.0.1.fx-zulu"
  "21.0.9.fx-zulu"
  "17.0.17.fx-zulu"
  "11.0.29.fx-zulu"
)

echo "Instalando JDKs..."

for JDK in "${JDKS[@]}"; do
  echo "→ Instalando Java $JDK"
  sdk install java "$JDK"
done

echo "Definindo Java default..."
sdk default java 25.0.1-graal

echo "Versões instaladas:"
sdk list java | grep installed

# https://docs.scala-lang.org/overviews/jdk-compatibility/overview.html
# Todas essas versões do Scala são compatíveis
# Com o JDK 25.
sdk install scala 3.7.4
sdk install scala 3.3.7
sdk install scala 2.13.18
sdk default scala 3.7.4

# https://docs.gradle.org/current/userguide/compatibility.html
# Gradle 9.*    -> JDK 25
# Gradle 8.14.* -> JDK 24
# Gradle 7.6.*  -> JDK 19
sdk install gradle 9.2.1
sdk install gradle 8.14.3
sdk install gradle 7.6
sdk default gradle 9.2.1

echo "Intalação do Maven"
sdk install maven 3.9.12
sdk default maven 3.9.12

echo "Intalação do Groovy"
sdk install groovy 5.0.3 
sdk install groovy 4.0.29
sdk default groovy 5.0.3 

if ! grep -q 'export JAVA_HOME=' "$HOME/.bashrc"; then
    {
		echo ""
		echo "## Caminhos para o Java"
		echo 'export JAVA_HOME=$HOME/.sdkman/candidates/java/current'
		echo 'export PATH=$PATH:$JAVA_HOME/bin' 
	} >> $HOME/.bashrc
else
    echo "Variável JAVA já definida"
fi

if ! grep -q 'export GRADLE_HOME=' "$HOME/.bashrc"; then
    {
		echo "## Caminhos para o Gradle"
		echo 'export GRADLE_HOME=$HOME/.sdkman/candidates/gladle/current'
		echo 'export PATH=$PATH:$GRADLE_HOME/bin'
	} >> $HOME/.bashrc
else
    echo "Variável GRADLE já definida"
fi

if ! grep -q 'export SCALA_HOME=' "$HOME/.bashrc"; then
    {
echo "## Caminhos para o Scala"
echo 'export SCALA_HOME=$HOME/.sdkman/candidates/scala/current'
echo 'export PATH=$PATH:$SCALA_HOME/bin'
	} >> $HOME/.bashrc
else
    echo "Variável SCALA já definida"
fi

if ! grep -q 'export MVN_HOME=' "$HOME/.bashrc"; then
    {
echo "## Caminhos para o Maven"
echo 'export MVN_HOME=$HOME/.sdkman/candidates/maven/current' 
echo 'export PATH=$PATH:$MVN_HOME/bin'
	} >> $HOME/.bashrc
else
    echo "Variável MVN já definida"
fi

if ! grep -q 'export GROOVY_HOME=' "$HOME/.bashrc"; then
    {
echo "## Caminhos para o Groovy"
echo 'export GROOVY_HOME=$HOME/.sdkman/candidates/groovy/current'
echo 'export PATH=$PATH:$MVN_HOME/bin'
	} >> $HOME/.bashrc
else
    echo "Variável GROOVY já definida"
fi
