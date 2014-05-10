import edu.harvard.Disease
import edu.harvard.Patient;
import edu.harvard.Symptom;

class BootStrap {

	def init = { servletContext ->
		Random rand = new Random()
		int max = 100
		(0..25).each{
			new Disease(name:"Disease$it",percentSurvival:rand.nextInt(max)).save()
		}

		(0..25).each{
			new Symptom(name:"Symptom$it",suggestedTreatment:rand.nextInt(max)).save()
		}

		(0..100).each{
			def p = new Patient(name:"Patient$it",dateOfBirth:new Date(),dateOfDeath:new Date()).save()
		}

		(1..100).each{
			def p = Patient.findByName("Patient$it")
			if (p){
				rand.nextInt(5).times{
					def r = Patient.findByName("Patient${rand.nextInt(max)}")
					if (r){
						
						println "$p $r"
						p.relatives += [r]
						p.save(flush:true)
					}
				}
				
			}
		}
	}
	def destroy = {
	}
}
