export default {
  async send(event, data = {}) {
    return await fetch(`https://ncs_core/${event}`, {
      mode: "no-cors",
      method: "post",
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-type": "application/json; charset=UTF-8",
      },
      body: JSON.stringify(data),
    });
  },

  emulate(type, data = null) {
    window.dispatchEvent(
      new MessageEvent("message", {
        data: { type, data },
      })
    );
  },
};
