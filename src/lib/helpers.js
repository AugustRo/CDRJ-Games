const bcrypt = require('bcryptjs');

const helpers = {};

helpers.encryptPassword = async (password) => {
  //https://heynode.com/blog/2020-04/salt-and-hash-passwords-bcrypt
  const salt = await bcrypt.genSalt(10);
  const hash = await bcrypt.hash(password, salt);
  return hash;
};

helpers.matchPassword = async (password, savedPassword) => {
  try {
    //req.flash('success','¡Bienvenido, sesión iniciada!');
    return await bcrypt.compare(password, savedPassword);
  } catch (e) {
    req.flash('message','Datos incorrectos, intenta de nuevo.');
    console.log(e);
  }
};

module.exports = helpers;