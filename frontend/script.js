let selectedCategory = "All"; // categoría seleccionada por defecto
let isLoading = false;

// Cache para sprites y tipos
let spritesCache = null;
let typesCache = null;

// Obtener todos los objetos
async function GetObjects() {
    const res = await fetch('/api/Object');
    const data = await res.json();
    return data;
}

// Obtener todos los tipos (una vez)
async function GetTypes() {
    if (typesCache) return typesCache;
    const res = await fetch('/api/Type');
    typesCache = await res.json();
    return typesCache;
}

// Obtener todos los sprites (una vez)
async function GetSprites() {
    if (spritesCache) return spritesCache;
    const res = await fetch('/api/Sprite');
    spritesCache = await res.json();
    return spritesCache;
}

// Mapa para convertir ID_Type a nombre tipo
async function getTypeNameById(id) {
    const types = await GetTypes();
    const typeObj = types.find(t => t.ID === id);
    return typeObj ? typeObj.Name : "Unknown";
}

// Mapa para obtener path de sprite por ID
async function getSpritePathById(id) {
    const sprites = await GetSprites();
    const sprite = sprites.find(s => s.ID === id);
    return sprite ? sprite.Path : "";
}

// Selector y sección
const select = document.querySelector('.form-select');
const objectSection = document.querySelector(".Objects");

// Listener filtro
function FilterListener() {
    select.addEventListener('change', () => {
        let selectedOption = select.value;

        switch (selectedOption) {
            case "1": selectedCategory = 1; break; // ahora es ID_Type numérico
            case "2": selectedCategory = 2; break;
            case "3": selectedCategory = 3; break;
            case "4": selectedCategory = 4; break;
            case "5": selectedCategory = 5; break;
            case "6": selectedCategory = 6; break;
            case "7": selectedCategory = 7; break;
            case "8": selectedCategory = 8; break;
            default: selectedCategory = "All";
        }

        objectSection.innerHTML = ""; // limpiar

        RenderObjects(selectedCategory);
    });
}

// Filtrar por ID_Type numérico
function GetCategory(objects, category) {
    if (category === "All") return objects;
    return objects.filter(obj => obj.ID_Type === category);
}

// Renderizar objetos con await en loop
async function RenderObjects(category) {
    if (isLoading) return;
    isLoading = true;

    const allObjects = await GetObjects();
    const filteredObjects = GetCategory(allObjects, category);

    let template = "";
    for (let i = 0; i < filteredObjects.length; i++) {
        const obj = filteredObjects[i];
        const spritePath = await getSpritePathById(obj.ID_Sprite);
        const typeName = await getTypeNameById(obj.ID_Type);

        template += `
            <div class="card popup-anim" style="width: 12rem; animation-delay: ${i * 100}ms;">
                <img src="${spritePath}" class="card-img-top" alt="${obj.Name}">
                <div class="card-body">
                    <h5 class="card-title">${obj.Name}</h5>
                    <p class="card-text">${obj.Description}</p>
                    <p class="card-text">${typeName}</p>
                </div>
            </div>
        `;
    }

    objectSection.insertAdjacentHTML("beforeend", template);
    isLoading = false;
}

// Inicializamos
FilterListener();
RenderObjects(selectedCategory);
