$(() => {

    $('.container-context').hide();

    window.addEventListener('message', (event) => {
        const {action, data} = event.data;

        if(action == 'show:interfaz:context'){
            buildContextMenu(data)
        }else{
            $('.container-context').removeClass('show').addClass('hide')
            setTimeout(() => {
                $('.container-context').hide()
            }, 250)
        }
    });
})

const buildContextMenu = (data) => {

    const {title, items} = data;

    $('.container-items-context').empty()
    $('.title-context').text(title)

    $('.container-context').show().removeClass('hide').addClass('show')

    items.forEach((data, index) => {
        $('.container-items-context').append(`
            <div class="item-context">
                <div class="title-item">${data.title}</div>
                <div class="description-item">${data.description}</div>
            </div>
        `);
    
        $('.item-context').eq(index).click(() => {
            post('select_item', { value: data.value })
        });
    });
    
};

document.onkeyup = ({ key }) => key === 'Escape' && post('exit_context')

function post(url, data, cb) {
    $.post(`https://${GetParentResourceName()}/${url}`, JSON.stringify(data) || JSON.stringify({}), cb || function() {});
};