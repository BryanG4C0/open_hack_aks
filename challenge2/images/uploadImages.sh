# Declaramos el nombre de las imagenes que queremos subir
images=("userprofile" "user-java" "tripviewer" "trips")

# Definir arrays para almacenar nombres de imágenes etiquetadas correctamente y fallidas
etiquetadas=()
fallidas=()

# Tageamos las imagenes
for image in "${images[@]}"
do
    docker tag tripinsights/$image:1.0 registryxzq2360.azurecr.io/gacotripinsights/$image:1.0

    # Comprobar si el comando se ejecutó correctamente
  if [ $? -eq 0 ]; then
    echo "El comando se ejecutó correctamente para la imagen $image"
    # Agregar el nombre de la imagen a la lista de imágenes etiquetadas correctamente
    etiquetadas+=("$image")
  else
    echo "El comando falló para la imagen $image"
    # Agregar el nombre de la imagen a la lista de imágenes que fallaron al etiquetar
    fallidas+=("$image")
  fi
done

# Imprimir la lista de imágenes etiquetadas correctamente
echo "Imágenes etiquetadas correctamente: ${etiquetadas[@]}"

# Imprimir la lista de imágenes que fallaron al etiquetar
echo "Imágenes que fallaron al etiquetar: ${fallidas[@]}"

# Ejecutar el comando de Docker push para las imágenes etiquetadas correctamente
for imagen in "${etiquetadas[@]}"; do
  docker push "registryxzq2360.azurecr.io/gacotripinsights/$imagen:1.0"
done