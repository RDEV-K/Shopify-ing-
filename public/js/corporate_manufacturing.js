

document.addEventListener('alpine:init', () => {
    Alpine.data('manufacturing', () => ({
        simple: '', total_cost: 0, pkg_t_p: 0, ing_t_p: 0, ing_grp: [],
        pkg_t_cost: {
            ['x-ref']:'pkg_t_p',
            // ["x-bind:value"](event) {
            //     this.pkg_t_p += parseInt(this.$el.value);
            //     return this.$refs.ing_t_p.value;
            // }
        },
        models_igtp: {
            ['x-ref']:'ing_t_p',
            // ["x-bind:value"](event) {
            //     this.ing_t_p += parseFloat(this.$el.value);
            //     return this.$el.value;
            // }
        }
    }))
});