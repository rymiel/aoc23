type 'a t = ('a, unit) Hashtbl.t

let is_empty s = Hashtbl.length s = 0
let to_seq s = Hashtbl.to_seq_keys s
let create n = Hashtbl.create n
let add s v = Hashtbl.replace s v ()
let remove = Hashtbl.remove
let mem = Hashtbl.mem
let iter f set = Hashtbl.iter (fun k () -> f k) set