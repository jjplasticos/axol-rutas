Es la entidad que representa a una venta. 

Sus atributos en flutter son:
- id (string) 
- location (string) [[Notas#^091023a]]
- shoppingcart (map) [[Notas#^091023b]]
- cliente (string) [[Notas#^091023c]]
- time(string) [[Notas#^091023d]]
- totalQuantity (string) [[Notas#^091023e]]
- totalWeight (string) [[Notas#^091023e]]
- totalPrice (string) [[Notas#^091023e]]
- type (string)
- note (string)

Atributos en base de datos:
- id (uuid)
- client_name (text)
- time (text) [[Notas#^091023f]]
- location (text)
- vendor (text)
- total_price (float8)
- total_quantity (float8)
- total_weight (float8)
- product_list (jsonb)
- type (text)
- note (text)