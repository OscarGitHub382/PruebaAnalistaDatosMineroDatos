# PruebaAnalistaDatosMineroDatos
Ejercicio en varias fases: formateo de una base de datos para importarla a MySQL, creación de tablas con claves primarias y foráneas, conexión con Power BI y nuevo formateo en Power Query para mejorar los datos y crear un dashboard más eficiente.

## Descripción del Proyecto

Este proyecto consistió en el análisis, procesamiento y visualización de datos de interacciones de un chatbot con el objetivo de comprender el comportamiento de los usuarios y la eficiencia del bot. Se partió de un archivo Excel con datos sin procesar y se llegó a un dashboard interactivo en Power BI, pasando por etapas de limpieza y transformación de datos con Power Query, modelado de base de datos en MySQL y la creación de un modelo entidad-relación.

## Fases del Proyecto

1.  **Análisis Exploratorio de Datos (Excel):**
    * Se recibió un archivo Excel (`Prueba_AnalistaDeDatos.xlsx`) que contenía tres hojas de datos: `representantes`, `jefe` y `cliente`.
    * Se realizó un análisis detallado de la tabla `representantes` para comprender las columnas y los registros.
    * Se estructuró parcialmente en un flujograma los mensajes de la columna "response" (ver archivo `Flujograma Chatbot.vsdx`) para determinar la ruta y las opciones de respuesta esperadas del bot.
    * Se identificó la función de las columnas clave:
        * `query`: Mensaje inicial del usuario que inicia el chat.
        * `response`: Respuesta del bot al usuario.
        * `conversation_id`: Identificador único que agrupa todos los mensajes de una misma conversación. Permite rastrear el historial de una interacción.
        * `intent`: Intención detectada por el bot en la `query` del usuario.

2.  **Preparación y Formateo de Datos con Power Query (Excel):**
    * Se utilizó Power Query dentro de Excel para preparar la tabla `representantes` para su correcta importación a MySQL. Las transformaciones clave incluyeron:
        * **Eliminación de formato ISO en fechas:** Se eliminaron las letras "T" y "Z" de las columnas de fecha para asegurar su correcta lectura por MySQL.
        * **Reemplazo de emojis:** Los emojis presentes en las columnas `query` y `response`, que representaban valores de calificación, fueron reemplazados por su valor textual equivalente basándose en cómo estos datos eran interpretados en la columna `entities`. Esto se realizó para evitar la pérdida de información durante la conversión a formato CSV necesaria para la importación a MySQL.
        * **Eliminación de saltos de línea:** Se eliminaron los saltos de línea presentes en las columnas `query` y `response` para asegurar la integridad de los datos al ser importados a la base de datos.
    * El resultado de este proceso se refleja en el archivo `Prueba_AnalistaDeDatos.xlsx`.

3.  **Creación de la Base de Datos en MySQL:**
    * Se crearon las tablas `representantes`, `jefe` y `cliente` en MySQL utilizando consultas SQL.
    * Se definieron las claves primarias y foráneas para establecer las relaciones entre las tablas.

4.  **Importación de Datos y Creación del MER (MySQL Workbench):**
    * Se utilizó el asistente de importación de datos de MySQL Workbench para cargar los datos desde archivos CSV (generados a partir de las hojas del Excel formateado) a las tablas correspondientes en la base de datos MySQL.
    * Se verificó que todos los datos se importaran correctamente.
    * Se creó el Modelo Entidad-Relación (MER) utilizando MySQL Workbench para visualizar la estructura de la base de datos y las relaciones entre las tablas.

5.  **Conexión de Power BI a MySQL:**
    * Se estableció una conexión entre Power BI Desktop y la base de datos MySQL utilizando la opción "Obtener datos" y seleccionando "Base de datos MySQL".
    * Se ingresaron las credenciales de acceso a la base de datos (usuario y contraseña).
    * Se seleccionaron las tablas `representantes`, `jefe` y `cliente` para importarlas al modelo de datos de Power BI.
    * Se verificó que las relaciones entre las tablas fueran detectadas correctamente por Power BI, basándose en las claves foráneas definidas en MySQL. Las relaciones esperadas son:
        * `jefe[Asesor]` (uno) a `representantes[network_user]` (muchos)
        * `cliente[Desc_Programa]` (uno) a `representantes[operation_user]` (muchos)

6.  **Creación del Dashboard en Power BI:**
    * Se procedió a la creación de un dashboard interactivo en Power BI, siguiendo los siguientes pasos y utilizando los KPIs y visualizaciones propuestas:

    ### 6.1. Indicadores Clave de Desempeño (KPIs):

    ### 6.2. Visualizaciones Efectivas (Página Principal / Resumen):
    * **Fila Superior (KPIs Principales):**

    * **Sección Central (Tendencias y Distribuciones):**

    * **Sección Inferior (Focos Críticos / Detalles):**

    ### 6.3. Segmentaciones Útiles (Slicers / Filtros):
    * **Rango de Fechas:** 
    * **Jefe:** 
    * **Asesor:** 
    * **Empresa Cliente:**
    * **Intent:**
    * **Validación Query:**
  
