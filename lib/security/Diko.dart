class Diko {
  static String encrypt(String s) {
    s = s.replaceAll('', ".");

    s = s.replaceAll('.9.', ".+.");
    s = s.replaceAll('.8.', ".-.");
    s = s.replaceAll('.7.', ".^.");
    s = s.replaceAll('.6.', ".(.");
    s = s.replaceAll('.5.', ".).");
    s = s.replaceAll('.4.', ".*.");
    s = s.replaceAll('.3.', ".&.");
    s = s.replaceAll('.2.', ".@.");
    s = s.replaceAll('.1.', ".!.");
    s = s.replaceAll('.0.', ".|.");

    s = s.replaceAll('.A.', ".0-.");
    s = s.replaceAll('.B.', "._A.");
    s = s.replaceAll('.C.', ".?Q.");
    s = s.replaceAll('.D.', ".b1.");
    s = s.replaceAll('.E.', "._B.");
    s = s.replaceAll('.F.', ".r2.");
    s = s.replaceAll('.G.', ".dd.");
    s = s.replaceAll('.H.', ".cc.");
    s = s.replaceAll('.I.', ".ee.");
    s = s.replaceAll('.J.', ".ff.");
    s = s.replaceAll('.K.', ".r_.");
    s = s.replaceAll('.L.', ".?b.");
    s = s.replaceAll('.M.', ".>m.");
    s = s.replaceAll('.N.', ".<l.");
    s = s.replaceAll('.O.', ".%g.");
    s = s.replaceAll('.P.', ".rQ.");
    s = s.replaceAll('.Q.', ".ZZ.");
    s = s.replaceAll('.R.', ".X/.");
    s = s.replaceAll('.S.', ".bG.");
    s = s.replaceAll('.T.', ".?V.");
    s = s.replaceAll('.U.', ".__.");
    s = s.replaceAll('.V.', ".w_.");
    s = s.replaceAll('.W.', ".W_.");
    s = s.replaceAll('.X.', ".ss.");
    s = s.replaceAll('.Y.', ".tt.");
    s = s.replaceAll('.Z.', ".uX.");

    s = s.replaceAll('.a.', ".*A.");
    s = s.replaceAll('.b.', ".@l.");
    s = s.replaceAll('.c.', ".@@.");
    s = s.replaceAll('.d.', ".^c.");
    s = s.replaceAll('.e.', ".!n.");
    s = s.replaceAll('.f.', ".NN.");
    s = s.replaceAll('.g.', ".m@.");
    s = s.replaceAll('.h.', ".c@.");
    s = s.replaceAll('.i.', ".Rr.");
    s = s.replaceAll('.j.', ".m1.");
    s = s.replaceAll('.k.', ".@4.");
    s = s.replaceAll('.l.', ".Jj.");
    s = s.replaceAll('.m.', ".^b.");
    s = s.replaceAll('.n.', ".^e.");
    s = s.replaceAll('.o.', ".Xc.");
    s = s.replaceAll('.p.', ".C@.");
    s = s.replaceAll('.q.', ".^@.");
    s = s.replaceAll('.r.', ".!z.");
    s = s.replaceAll('.s.', ".!@.");
    s = s.replaceAll('.t.', ".^!.");
    s = s.replaceAll('.u.', ".!l.");
    s = s.replaceAll('.v.', ".@M.");
    s = s.replaceAll('.w.', ".V^.");
    s = s.replaceAll('.x.', ".)(.");
    s = s.replaceAll('.y.', ".)!.");
    s = s.replaceAll('.z.', ".M).");

    return s;
  }

  static String decrypt(String s) {
    s = s.replaceAll(".uX.", '.Z.');
    s = s.replaceAll(".tt.", '.Y.');
    s = s.replaceAll(".ss.", '.X.');
    s = s.replaceAll(".W_.", '.W.');
    s = s.replaceAll(".w_.", '.V.');
    s = s.replaceAll(".__.", '.U.');
    s = s.replaceAll(".?V.", '.T.');
    s = s.replaceAll(".bG.", '.S.');
    s = s.replaceAll(".X/.", '.R.');
    s = s.replaceAll(".ZZ.", '.Q.');
    s = s.replaceAll(".rQ.", '.P.');
    s = s.replaceAll(".%g.", '.O.');
    s = s.replaceAll(".<l.", '.N.');
    s = s.replaceAll(".>m.", '.M.');
    s = s.replaceAll(".?b.", '.L.');
    s = s.replaceAll(".r_.", '.K.');
    s = s.replaceAll(".ff.", '.J.');
    s = s.replaceAll(".ee.", '.I.');
    s = s.replaceAll(".cc.", '.H.');
    s = s.replaceAll(".dd.", '.G.');
    s = s.replaceAll(".r2.", '.F.');
    s = s.replaceAll("._B.", '.E.');
    s = s.replaceAll(".b1.", '.D.');
    s = s.replaceAll(".?Q.", '.C.');
    s = s.replaceAll("._A.", '.B.');
    s = s.replaceAll(".0-.", '.A.');

    s = s.replaceAll(".M).", '.z.');
    s = s.replaceAll(".)!.", '.y.');
    s = s.replaceAll(".)(.", '.x.');
    s = s.replaceAll(".V^.", '.w.');
    s = s.replaceAll(".@M.", '.v.');
    s = s.replaceAll(".!l.", '.u.');
    s = s.replaceAll(".^!.", '.t.');
    s = s.replaceAll(".!@.", '.s.');
    s = s.replaceAll(".!z.", '.r.');
    s = s.replaceAll(".^@.", '.q.');
    s = s.replaceAll(".C@.", '.p.');
    s = s.replaceAll(".Xc.", '.o.');
    s = s.replaceAll(".^e.", '.n.');
    s = s.replaceAll(".^b.", '.m.');
    s = s.replaceAll(".Jj.", '.l.');
    s = s.replaceAll(".@4.", '.k.');
    s = s.replaceAll(".m1.", '.j.');
    s = s.replaceAll(".Rr.", '.i.');
    s = s.replaceAll(".c@.", '.h.');
    s = s.replaceAll(".m@.", '.g.');
    s = s.replaceAll(".NN.", '.f.');
    s = s.replaceAll(".!n.", '.e.');
    s = s.replaceAll(".^c.", '.d.');
    s = s.replaceAll(".@@.", '.c.');
    s = s.replaceAll(".@l.", '.b.');
    s = s.replaceAll(".*A.", '.a.');

    s = s.replaceAll(".|.", '.0.');
    s = s.replaceAll(".!.", '.1.');
    s = s.replaceAll(".@.", '.2.');
    s = s.replaceAll(".&.", '.3.');
    s = s.replaceAll(".*.", '.4.');
    s = s.replaceAll(".).", '.5.');
    s = s.replaceAll(".(.", '.6.');
    s = s.replaceAll(".^.", '.7.');
    s = s.replaceAll(".-.", '.8.');
    s = s.replaceAll(".+.", '.9.');

    s = s.replaceAll('.', "");

    return s;
  }
}

void man(List<String> args) {
  var asa = Diko.encrypt("Price=1000, name=Prommise Uzo, price=2200021");
  print(asa);
  print(Diko.decrypt(asa));
  // g();
}

g() {
  for ( //for keyword then open brackets like this (declare loop variable; condition; increment/decrement)
      int i =
          0; // on this line the variable 'i' is defined, it will serve as loop variable
      i <=
          10; // on this line the condition is stated "is i less than or equals 10?"
      i += 1 // here m just saying add one(1) to whatever i is
      ) {
    print(i); //this line prints our loop variable i
  }
  for (var i = 1; i <= 10; i++) {
    print(i);
  }

  /*
  and: and
  or: or
  logical and: &&
  logical or: ||

  multiply: *
  divide: /
  add: +
  subtract: -
  increment by one: ++
  increment by n: +=n
  decrement by 1: --
  decrement by n: -=n
  multiply by n: *=n
  devide by n: /=n

  asignment: =

  is equal: ==
  is less than: <
  is greater than: >
  is greater than or equal: >=
  is less than or equal: <=
  is not: !
  is not equal: !=




   */
}
