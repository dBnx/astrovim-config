
return {
	parse("default", '
import numpy as np
import matplotlib.pyplot as plt
np.set_printoptions(precision=2)
plt.rcParams[\"figure.autolayout\"] = True
plt.rcParams.update({
    \"text.usetex\": True,
    \"font.family\": \"serif\",
})')
}, {
	--parse("autotrig", "autotriggered, if enabled")
}
